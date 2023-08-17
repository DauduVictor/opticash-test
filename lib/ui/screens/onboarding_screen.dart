import 'package:flutter/material.dart';
import 'package:opticash_test/ui/ui.dart';
import 'package:opticash_test/utils/utils.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = 'onboardingScreen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  /// Declaring the tween animation
  late final CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  int position = 0;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Map to show user password strength in colors
  Map<int, Color> indicatorColor = {
    1: AppColors.redColor,
    2: AppColors.yellowColor,
    3: AppColors.greenColor,
    4: AppColors.greenColor,
  };

  // list to hold main text for animation display
  final mainText = [
    'Send Money faster than imagined',
    'Top up your balance on the fly',
    'View your bank detials all in one place',
  ];

  // list to hold main text for animation display
  final subText = [
    'Opticash provides you the fastest remittance to send and receive money!',
    'Opticash allows users to send fast payments worldwide using blockchain technology',
    'Opticash is the best place to trade your crypto',
  ];

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Container(
        width: mqr.width,
        height: mqr.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(onboardingImage),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: AnimatedBuilder(
              animation: _curvedAnimation,
              builder: (context, _) {
                if (_controller.value < 0.3) {
                  position = 0;
                } else if (_controller.value >= 0.3 &&
                    _controller.value < 0.6) {
                  position = 1;
                } else {
                  position = 2;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      mainText[position],
                      style: textTheme.headlineLarge!.copyWith(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: EdgeInsets.only(right: mqr.width * 0.1),
                      child: Text(
                        subText[position],
                        style: textTheme.bodyLarge!.copyWith(
                          fontFamily: 'Poppins',
                          color: AppColors.lightGreyColor2,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: mqr.height * 0.043),
                    Row(
                      children: [
                        Container(
                          color: position == 0
                              ? AppColors.lightGreenColor
                              : AppColors.lightGreyColor,
                          height: 2,
                          width: mqr.width * 0.19,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          color: position == 1
                              ? AppColors.lightGreenColor
                              : AppColors.lightGreyColor,
                          height: 2,
                          width: mqr.width * 0.19,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          color: position == 2
                              ? AppColors.lightGreenColor
                              : AppColors.lightGreyColor,
                          height: 2,
                          width: mqr.width * 0.19,
                        ),
                      ],
                    ),
                    SizedBox(height: mqr.height * 0.039),
                    GradientButton(
                      label: 'Create New Account',
                      onTap: () =>
                          Navigator.pushNamed(context, CreateAccount.id),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, SignIn.id),
                      child: Text(
                        'Sign In',
                        style: textTheme.labelLarge!.copyWith(
                          color: AppColors.whiteColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 15,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
