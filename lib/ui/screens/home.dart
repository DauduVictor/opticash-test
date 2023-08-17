import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:opticash_test/models/user-model.dart';
import 'package:opticash_test/ui/ui.dart';
import 'package:opticash_test/utils/utils.dart';

class Home extends HookWidget {
  static const String id = 'home';
  const Home({super.key, this.userModel});

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final tab = useState(0);
    return Scaffold(
      // app bar
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            // profile picture
            Container(
              margin: const EdgeInsets.only(left: 0, right: 13),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.greyColor2,
                image: DecorationImage(image: AssetImage(avatarImage)),
              ),
            ),
            // user name and username
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${userModel?.user?.firstName ?? 'There'}!',
                    style: textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor3,
                      fontSize: 21,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${userModel?.user?.userName ?? ''}',
                    style: textTheme.titleMedium!.copyWith(
                      color: AppColors.greyColor2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: const [
          AppBarActionIcons(
            iconName: historyIcon,
          ),
          SizedBox(width: 8),
          AppBarActionIcons(
            iconName: bellIcon,
            iconNum: '2',
          ),
          SizedBox(width: 19),
        ],
      ),
      // body and bottom nav
      body: Container(
        height: mqr.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage(patternMoneyImage),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Stack(
                children: [
                  if (tab.value == 0) const HomePage(),
                  if (tab.value == 1) const Cards(),
                  if (tab.value == 2) const Send(),
                  if (tab.value == 3) const Swap(),
                  if (tab.value == 4) const Account(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 90,
                width: mqr.width,
                padding: const EdgeInsets.fromLTRB(12, 13, 12, 0),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 4.5,
                      blurRadius: 3.5,
                      color: AppColors.blackColor.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavWidget(
                      navName: 'Home',
                      navIconData: homeIcon,
                      position: 0,
                      currentPosition: tab.value,
                      onTap: () {
                        changeTab(tab, 0);
                      },
                    ),
                    SizedBox(width: mqr.width * 0.05),
                    BottomNavWidget(
                      navName: 'Card',
                      navIconData: creditCardIcon,
                      position: 1,
                      currentPosition: tab.value,
                      onTap: () {
                        changeTab(tab, 1);
                      },
                    ),
                    Expanded(
                      child: Transform.translate(
                        offset: const Offset(0, -40.5),
                        child: GestureDetector(
                          onTap: () {
                            changeTab(tab, 2);
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                decoration: BoxDecoration(
                                  color: AppColors.deepDarkGreenColor,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Image.asset(
                                  optiCashIcon,
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(0, 15),
                                child: Text(
                                  'Send',
                                  style: textTheme.titleMedium!.copyWith(
                                    color: tab.value == 2
                                        ? AppColors.secondaryColor
                                        : AppColors.greyColor2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BottomNavWidget(
                      navName: 'Swap',
                      navIconData: moneyTransferIcon,
                      position: 3,
                      currentPosition: tab.value,
                      onTap: () {
                        changeTab(tab, 3);
                      },
                    ),
                    SizedBox(width: mqr.width * 0.05),
                    BottomNavWidget(
                      navName: 'Account',
                      navIconData: mechanicIcon,
                      position: 4,
                      currentPosition: tab.value,
                      onTap: () {
                        changeTab(tab, 4);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void changeTab(ValueNotifier tab, int index) {
  if (tab.value != index) {
    tab.value = index;
  }
}

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.navName,
    required this.navIconData,
    required this.onTap,
    required this.position,
    required this.currentPosition,
  });

  final String navName;
  final String navIconData;
  final void Function()? onTap;
  final int position;
  final int currentPosition;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: AppColors.whiteColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                navIconData,
                width: 25,
                height: 25,
                color: position == currentPosition
                    ? AppColors.secondaryColor
                    : AppColors.greyColor2,
              ),
              const SizedBox(height: 5),
              Text(
                navName,
                style: textTheme.titleMedium!.copyWith(
                  color: position == currentPosition
                      ? AppColors.secondaryColor
                      : AppColors.greyColor2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarActionIcons extends StatelessWidget {
  const AppBarActionIcons({
    super.key,
    required this.iconName,
    this.iconNum,
  });

  final String iconName;
  final String? iconNum;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.greyColor6,
            child: SvgPicture.asset(iconName),
          ),
          Transform.translate(
            offset: const Offset(0, -3),
            child: CircleAvatar(
              radius: iconNum == null ? 7 : 8,
              backgroundColor: AppColors.redColor,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  iconNum ?? '',
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
