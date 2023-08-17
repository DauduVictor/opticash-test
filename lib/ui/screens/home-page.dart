import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:opticash_test/ui/ui.dart';
import 'package:opticash_test/utils/utils.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final isAmountVisible = useState(true);
    return SizedBox(
      width: mqr.width,
      height: mqr.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              // action container
              Transform.translate(
                offset: Offset(0, mqr.height * 0.09),
                child: Container(
                  padding: const EdgeInsets.only(top: 25, bottom: 9),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const DashboardActionWidget(
                        actionIcon: sendMoneyIcon,
                        actionName: 'Send Money',
                      ),
                      Container(
                        color: AppColors.greyColor7,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 1.5,
                        height: mqr.height * 0.04,
                      ),
                      const SizedBox(width: 10),
                      const DashboardActionWidget(
                        actionIcon: addMoneyWalletIcon,
                        actionName: 'Top-Up',
                        padding: 4,
                      ),
                      Container(
                        color: AppColors.greyColor7,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 1.5,
                        height: mqr.height * 0.04,
                      ),
                      const DashboardActionWidget(
                        actionIcon: bankAccountIcon,
                        actionName: 'Account Details',
                        padding: 4,
                      ),
                    ],
                  ),
                ),
              ),
              //main Container
              Container(
                width: mqr.width,
                margin: const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.blackColor,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.loose,
                  children: [
                    Transform.translate(
                      offset: const Offset(30, 70),
                      child: Transform.scale(
                        scale: 1.9,
                        child: Image.asset(
                          homemainConDesImage,
                          width: 400,
                          height: 190,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: AppColors.secondaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                threeDCoinImage,
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                'Opticash Balance',
                                style: textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 15),
                              const CircleAvatar(
                                radius: 12,
                                backgroundColor: AppColors.whiteColor,
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          isAmountVisible.value ? '\$243,998' : '***',
                          textAlign: TextAlign.center,
                          style:
                              textTheme.headlineMedium!.copyWith(fontSize: 41),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          isAmountVisible.value
                              ? '123848492920304.234 (OPCH)'
                              : '***',
                          style: textTheme.titleMedium!.copyWith(
                              fontSize: 11, color: AppColors.lightGreenColor2),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () =>
                              isAmountVisible.value = !isAmountVisible.value,
                          child: Icon(
                            isAmountVisible.value == false
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: mqr.height * 0.11),
          const SizedBox(height: 34),
          // transaction
          Text(
            'Today, 26 june 2021',
            style: textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor2,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor2.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.greyColor8,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(nigeriaImage),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transfer to Victor',
                            style: textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor2,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            '- N1.890',
                            style: textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.redColor,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 3),
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor: AppColors.yellowColor,
                                ),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                'Pending',
                                style: textTheme.labelLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.yellowColor,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '10th July 2023',
                            style: textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor2,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardActionWidget extends StatelessWidget {
  const DashboardActionWidget({
    super.key,
    required this.actionName,
    required this.actionIcon,
    this.padding = 0,
  });

  final String actionName;
  final String actionIcon;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(11),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: padding),
            child: SvgPicture.asset(actionIcon),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          actionName,
          style: textTheme.titleMedium!.copyWith(
            fontSize: 11,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
