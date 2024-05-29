
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_fine/screens/splash_screen.dart';
import 'package:ur_fine/services/routes.dart';
import 'package:ur_fine/services/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ur_fine/services/user_details_provider.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:  [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => UserDetailsProvider()),
        ],
        builder: (context, child) {
          return Consumer<ThemeProvider>(
            builder: (BuildContext context, themeProvider, Widget? child) {
              return  MaterialApp(
                onGenerateRoute: RouteGenerator.generateRoutes,
                debugShowCheckedModeBanner: false,
                title: 'U R Fine',
                theme: ThemeData(
                  canvasColor: Colors.lightBlueAccent,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.lightBlueAccent,
                    brightness: themeProvider.isDark ? Brightness.dark : Brightness.light
                  ),
                  useMaterial3: true,
                ),
                home: const Scaffold(body: SplashScreen()),
              );
            },
          );
        });
  }
}
