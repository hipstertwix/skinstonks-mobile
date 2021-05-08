import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'package:skinstonks_mobile/locator.dart';
import 'package:skinstonks_mobile/routes/index.dart' as router;
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:skinstonks_mobile/services/connection_status.dart';
import 'package:skinstonks_mobile/services/navigation_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Connection Status Singleton
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  // Locator
  setupLocator();

  runApp(SkinstonksApp());
}

class SkinstonksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (_) => locator<AuthService>(),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: MaterialApp(
          title: 'Skinstonks',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: kScaffoldBackgroundColor,
              fontFamily: 'Montserrat',
              textTheme: TextTheme(
                bodyText2: TextStyle(
                  color: kPrimaryTextColor,
                ),
              )),
          initialRoute: '/',
          onGenerateRoute: router.generateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
        ),
      ),
    );
  }
}
