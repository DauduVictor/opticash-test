import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:opticash_test/repository/user-repository.dart';
import 'package:opticash_test/ui/ui.dart';
import 'package:opticash_test/utils/utils.dart';
import 'widgets/dismiss-keyboard.dart';

class SignIn extends HookWidget {
  static const String id = 'signIn';
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final formKey = useState(GlobalKey<FormState>());
    final showSpinner = useState(false);
    // bool variable to show or hide user password
    final showPassword = useState(true);

    // TextEditingControllers for form
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return DismissKeyboard(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Container(
          height: mqr.height,
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
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                      child: Icon(
                        Icons.chevron_left_rounded,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Sign In',
                  style: textTheme.headlineLarge!.copyWith(
                    fontSize: 30,
                    color: AppColors.darkGreenColor2,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(right: mqr.width * 0.1),
                  child: Text(
                    'Sign In to your account using your email address and password',
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
                        textFieldName: 'Email',
                        textEditingController: emailController,
                        validator: ValidationExtension.validateEmailAddress,
                      ),
                      CustomTextFormField(
                        textFieldName: 'Password',
                        textEditingController: passwordController,
                        validator: ValidationExtension.validateFieldNotEmpty,
                        obscureText: showPassword.value,
                        suffix: GestureDetector(
                          onTap: () => showPassword.value = !showPassword.value,
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
                SizedBox(height: mqr.height * 0.06),
                Center(
                  child: Text(
                    'Forgot Password?',
                    style: textTheme.bodyLarge!.copyWith(
                      color: AppColors.greyColor2,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
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
                        const TextSpan(text: 'Don’t have account? '),
                        TextSpan(
                          text: 'Create Account',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushReplacementNamed(
                                context, CreateAccount.id),
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
                const SizedBox(height: 40),
                Button(
                  label: 'SIGN IN',
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
                        await UserRepository().signIn(
                          email: emailController.text.toLowerCase(),
                          password: passwordController.text,
                        ).then((userModel) {
                          showSpinner.value = false;
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home(userModel: userModel)),
                            (route) => false,
                          );
                        }).catchError((e) {
                          showSpinner.value = false;
                          ShowMessage.showSnackBar(context, e.toString());
                        });
                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
