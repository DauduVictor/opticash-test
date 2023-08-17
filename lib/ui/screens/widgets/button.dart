import 'package:flutter/material.dart';
import 'package:opticash_test/ui/ui.dart';

class Button extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color labelColor;
  final Color? color;
  final Widget? child;
  final double verticalPadding;
  final double? fontSize;
  final double? borderRadius;

  const Button(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.labelColor = AppColors.whiteColor,
      this.child,
      this.color,
      this.fontSize,
      this.borderRadius,
      this.verticalPadding = 23})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        backgroundColor: color ?? AppColors.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FittedBox(
              child: child ??
                  Text(
                    label,
                    textScaleFactor: 1,
                    style: textTheme.bodyMedium!.copyWith(
                      color: labelColor,
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    required this.label,
    required this.onTap,
    super.key,
  });

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 23),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            colors: [
              AppColors.darkGreenColor,
              AppColors.gradientLightGreenColor,
            ],
          ),
        ),
        child: Center(
          child: Text(
            label,
            textScaleFactor: 1,
            style: textTheme.bodyMedium!.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
