import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:opticash_test/repository/user-repository.dart';
import 'package:opticash_test/ui/screens/widgets/dismiss-keyboard.dart';
import 'package:opticash_test/ui/ui.dart';
import 'package:opticash_test/utils/utils.dart';

class CreateAccount extends HookWidget {
  static const String id = 'createAccount';
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final formKey = useState(GlobalKey<FormState>());
    final isShowCreateAccPop = useState(false);
    final showSpinner = useState(false);

    // bool variable to show or hide user password
    final showPassword = useState(false);
    final passwordText = useState(0);

    // TextEditingControllers for form
    final firstNameController = useTextEditingController();
    final lasttNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    // Map to show user password strength in colors
    Map<int, Color> passwordStrengthColor = {
      1: AppColors.redColor,
      2: AppColors.yellowColor,
      3: AppColors.greenColor,
      4: AppColors.greenColor,
    };

    // Map to show user password strength in string
    Map<int, String> passwordStrengthText = {
      1: 'Weak',
      2: 'Fair',
      3: 'Strong',
      4: 'Very Strong',
    };

    return DismissKeyboard(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ValueListenableBuilder(
              valueListenable: isShowCreateAccPop,
              builder: (context, showPop, _) {
                return Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 23.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.bottomCenter,
                          image: AssetImage(patternMoneyImage),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).padding.bottom,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: AppColors.darkGreenColor2,
                                    width: 2.4,
                                  )),
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 6),
                                  child: Icon(
                                    Icons.chevron_left_rounded,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Create Account',
                              style: textTheme.headlineLarge!.copyWith(
                                fontSize: 30,
                                color: AppColors.darkGreenColor2,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.only(right: mqr.width * 0.1),
                              child: Text(
                                'Register a new account using your email address and fill in your informations',
                                style: textTheme.bodyLarge!.copyWith(
                                  color: AppColors.greyColor2,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(height: mqr.height * 0.05),
                            Form(
                              key: formKey.value,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    textFieldName: 'First Name',
                                    textEditingController: firstNameController,
                                    validator: ValidationExtension
                                        .validateFieldNotEmpty,
                                  ),
                                  CustomTextFormField(
                                    textFieldName: 'Last Name',
                                    textEditingController: lasttNameController,
                                    validator: ValidationExtension
                                        .validateFieldNotEmpty,
                                  ),
                                  CustomTextFormField(
                                    textFieldName: 'Email',
                                    textEditingController: emailController,
                                    validator: ValidationExtension
                                        .validateEmailAddress,
                                  ),
                                  CustomTextFormField(
                                    textFieldName: 'Password',
                                    textEditingController: passwordController,
                                    validator: ValidationExtension
                                        .validateFieldNotEmpty,
                                    obscureText: showPassword.value,
                                    onChanged: (value) {
                                      if (value!.length > 2)
                                        passwordText.value = 1;
                                      if (value.length > 3)
                                        passwordText.value = 2;
                                      if (value.length > 4)
                                        passwordText.value = 3;
                                      if (value.length > 5)
                                        passwordText.value = 4;
                                    },
                                    suffix: GestureDetector(
                                      onTap: () => showPassword.value =
                                          !showPassword.value,
                                      child: Icon(
                                        showPassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 19,
                                      ),
                                    ),
                                    bottomSpacing: false,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: ValueListenableBuilder(
                                  valueListenable: passwordText,
                                  builder: (context, password, _) {
                                    return Row(
                                      children: [
                                        PasswordIndicator(
                                          color: passwordStrengthColor[
                                                  passwordText.value] ??
                                              AppColors.greyColor5,
                                        ),
                                        PasswordIndicator(
                                          color: passwordText.value >= 2
                                              ? passwordStrengthColor[
                                                      passwordText.value] ??
                                                  AppColors.greyColor5
                                              : AppColors.greyColor5,
                                        ),
                                        PasswordIndicator(
                                            color: passwordText.value >= 3
                                                ? passwordStrengthColor[
                                                        passwordText.value] ??
                                                    AppColors.greyColor5
                                                : AppColors.greyColor5),
                                        PasswordIndicator(
                                            color: passwordText.value >= 4
                                                ? passwordStrengthColor[
                                                        passwordText.value] ??
                                                    AppColors.greyColor5
                                                : AppColors.greyColor5),
                                        const SizedBox(width: 3),
                                        Text(
                                          passwordStrengthText[
                                                  passwordText.value] ??
                                              '',
                                          style: textTheme.bodyLarge!.copyWith(
                                            color: passwordStrengthColor[
                                                    passwordText.value] ??
                                                AppColors.greyColor5,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            SizedBox(height: mqr.height * 0.04),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: textTheme.bodyLarge!.copyWith(
                                    color: AppColors.greyColor2,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                  children: [
                                    const TextSpan(
                                        text: 'Already have an account? '),
                                    TextSpan(
                                      text: 'Sign In',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            Navigator.pushReplacementNamed(
                                                context, SignIn.id),
                                      style: textTheme.bodyLarge!.copyWith(
                                        color: AppColors.darkGreenColor2,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 13),
                            Button(
                              label: 'CREATE NEW ACCOUNT',
                              child: showSpinner.value == true
                                  ? const SizedBox(
                                      height: 14.5,
                                      width: 14.5,
                                      child: CircularProgressIndicator(
                                        color: AppColors.whiteColor,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : null,
                              onPressed: () async {
                                if (showSpinner.value == false) {
                                  if (formKey.value.currentState!.validate()) {
                                    showSpinner.value = true;
                                    await UserRepository().createAccount(
                                      firstName: firstNameController.text,
                                      lastName: lasttNameController.text,
                                      email: emailController.text.toLowerCase(),
                                      password: passwordController.text,
                                    ).then((value) {
                                      showSpinner.value = false;
                                      showSignInDialog(context, textTheme, isShowCreateAccPop);
                                    }).catchError((e) {
                                      showSpinner.value = false;
                                      ShowMessage.showSnackBar(context, e.toString());
                                    });
                                  }
                                }
                              },
                            ),
                            const SizedBox(height: 13),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mqr.width * 0.1),
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: textTheme.bodyLarge!.copyWith(
                                      color: AppColors.greyColor2,
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                    ),
                                    children: [
                                      const TextSpan(
                                          text:
                                              'By signing up you agree to our '),
                                      TextSpan(
                                        text: 'Term Of Use',
                                        style: textTheme.bodyLarge!.copyWith(
                                          color: AppColors.darkGreenColor2,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      const TextSpan(text: ' and '),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: textTheme.bodyLarge!.copyWith(
                                          color: AppColors.darkGreenColor2,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    if (isShowCreateAccPop.value)
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: AppColors.whiteColor.withOpacity(0.2),
                        ),
                      ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

void showSignInDialog(
  BuildContext context,
  TextTheme textTheme,
  ValueNotifier isShadowShown,
) {
  isShadowShown.value = true;
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
      children: [
        Image.asset(
          optiCashIcon,
          width: 70,
          height: 70,
        ),
        const SizedBox(height: 15),
        Text(
          'Account Created\nSuccessfully',
          textAlign: TextAlign.center,
          style: textTheme.headlineLarge!.copyWith(
            fontSize: 17,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 21),
        Button(
          label: 'SIGN IN',
          verticalPadding: 14,
          fontSize: 14,
          borderRadius: 12,
          color: AppColors.greenColor2,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, SignIn.id);
          },
        ),
      ],
    ),
  ).then((value) => isShadowShown.value = false);
}

class PasswordIndicator extends StatelessWidget {
  const PasswordIndicator({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return Container(
      height: 4.5,
      width: mqr.width * 0.055,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
      ),
    );
  }
}
