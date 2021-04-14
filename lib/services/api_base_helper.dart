import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skinstonks_mobile/constants/api_paths.dart';
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:skinstonks_mobile/services/connection_status.dart';

class ApiBaseHelper {
  static final String apiBaseUrl = API_URL;

  static final BaseOptions options = BaseOptions(
    baseUrl: apiBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  final AuthService authService;

  late final Dio dio;

  ApiBaseHelper({
    required this.authService,
  }) {
    this._initApiBaseHelper();
  }

  void _initApiBaseHelper() {
    this.dio = addInterceptors(Dio(options));
  }

  Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Before request get the user jwtToken and update the headers
          String? jwtToken = this.getUserJwtToken();
          if (jwtToken != null) options.headers['x-auth-token'] = jwtToken;
          return handler.next(options);
        },
        onError: (err, handler) async {
          // If TokenExpiredError, refresh the token and retry request
          if (err.response?.data["name"] == "TokenExpiredError") {
            final bool refreshed = await authService.refreshToken();
            if (refreshed) {
              print('Token refreshed!');
              return handler.resolve(await _retry(err.requestOptions));
            }
          }
          return handler.reject(err);
        },
      ));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return this.dio.request(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options,
        );
  }

  Future<dynamic> callApi(
    String method,
    String path, {
    Object? body,
    Map<String, String>? customHeaders,
  }) async {
    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    bool hasConnection = await connectionStatus.checkConnection();
    // Throw error and cancel request if no internet connection
    if (!hasConnection)
      throw AppException('Request failed, check your internet connection and try again.');

    try {
      var options = new Options(
        method: method,
        headers: _setHeaders(customHeaders),
      );

      var response = await this.dio.request(
            path,
            data: body,
            options: options,
          );

      return response.data;
    } on DioError catch (err) {
      if (err.error is SocketException) {
        throw AppException('Request failed, check your internet connection and try again.');
      } else if (err.error is AppException) {
        throw err.error;
      } else {
        throw AppException(err.response?.data['message']);
      }
    }
  }

  Map<String, String> _setHeaders(Map<String, String>? customHeaders) {
    Map<String, String> headers = Map();

    headers = {
      "Content-Type": "application/json",
    };

    if (customHeaders != null)
      customHeaders.forEach((key, value) {
        headers[key] = value;
      });

    return headers;
  }

  String? getUserJwtToken() {
    final user = this.authService.user;
    if (user != null) return user.jwtToken;
  }
}

class AppException {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}
