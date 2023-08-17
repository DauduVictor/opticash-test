import 'package:flutter/material.dart';
import 'package:opticash_test/ui/screens/screens.dart';
import 'package:opticash_test/ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opti Cash',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        OnboardingScreen.id: (context) => const OnboardingScreen(),
        SignIn.id: (context) => const SignIn(),
        CreateAccount.id: (context) => const CreateAccount(),
        Home.id: (context) => const Home(),
      },
    );
  }
}
