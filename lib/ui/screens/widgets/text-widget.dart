import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opticash_test/ui/theme/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.labelText,
    required this.textEditingController,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.prefix,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.bottomSpacing = true,
    this.maxLength,
    this.autofocus = false,
    this.hintColor = AppColors.greyColor2,
    this.borderColor,
    this.focusedBorderColor,
    this.height,
    this.helperText,
    this.helperColor,
    this.fontSize,
    this.textFieldName,
    this.obscureCharacter,
    this.onSaved,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final Widget? suffix;
  final Widget? prefix;
  final bool readOnly;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final bool? bottomSpacing;
  final int? maxLength;
  final bool autofocus;
  final Color hintColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? height;
  final String? helperText;
  final Color? helperColor;
  final double? fontSize;
  final String? textFieldName;
  final Widget? obscureCharacter;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: height,
              child: TextFormField(
                controller: textEditingController,
                onChanged: onChanged,
                validator: validator,
                obscureText: obscureText,
                maxLines: maxLines,
                cursorColor: AppColors.secondaryColor,
                
                autovalidateMode: autoValidateMode,
                readOnly: readOnly,
                maxLength: maxLength,
                textInputAction: textInputAction,
                autofocus: autofocus,
                onSaved: onSaved,
                textCapitalization: textCapitalization,
                keyboardType: keyboardType,
                autocorrect: false,
                style: textTheme.bodyMedium!.copyWith(
                    fontSize: fontSize,
                    color: AppColors.blackColor2,
                    fontFamily: 'Poppins'),
                onTap: onTap,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  helperText: helperText,
                  suffixIcon: suffix,
                  // suffix: suffix,
                  prefixIcon: prefix,
                  hintText: hintText,
                  hintStyle: textTheme.titleMedium!
                      .copyWith(color: hintColor, fontFamily: 'Poppins'),
                  labelText: labelText,
                  labelStyle: textTheme.titleMedium!
                      .copyWith(color: AppColors.greyColor),
                  focusColor: AppColors.primaryColor,
                  fillColor: AppColors.whiteColor,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(24, 20, 3, 18),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide:
                        BorderSide(color: borderColor ?? AppColors.greyColor3),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide:
                        BorderSide(color: borderColor ?? AppColors.greyColor3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide:
                        BorderSide(color: borderColor ?? AppColors.greyColor3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.darkGreenColor2,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: textFieldName != null,
              child: Transform.translate(
                offset: const Offset(15, -18),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.greyColor4,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    textFieldName ?? '',
                    style: textTheme.headlineSmall!.copyWith(
                        fontSize: 12,
                        color: AppColors.greyColor2,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: bottomSpacing ?? false,
          child: const SizedBox(height: 31),
        ),
      ],
    );
  }
}
