import 'package:flutter/material.dart';
import 'package:opticash_test/ui/ui.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: mqr.width,
      height: mqr.height,
      child: Center(
        child: Text(
          'Cards',
          style: textTheme.bodyLarge!.copyWith(
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}