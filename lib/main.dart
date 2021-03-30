import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'package:skinstonks_mobile/locator.dart';
import 'package:skinstonks_mobile/routes/index.dart' as router;
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:skinstonks_mobile/services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(SkinstonksApp());
}

class SkinstonksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FlutterSecureStorage()),
        )
      ],
      child: MaterialApp(
        title: 'Skinstonks',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
          fontFamily: 'Montserrat',
        ),
        initialRoute: '/',
        onGenerateRoute: router.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
