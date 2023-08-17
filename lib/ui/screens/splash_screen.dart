import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:opticash_test/ui/ui.dart';
import 'package:opticash_test/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    routeToMainScreen();
    super.initState();
  }

  // function to display splash screen for 1.5 sec
  // and auto navigate to page
  void routeToMainScreen() async {
    await Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => Navigator.pushReplacementNamed(context, OnboardingScreen.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage(particlesImages)),
        ),
        child: Center(
          child: Image.asset(
            optiCashIcon,
            width: 109,
            height: 128,
          ).animate().slideY(),
        ),
      ),
    );
  }
}
