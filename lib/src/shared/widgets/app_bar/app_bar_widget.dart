import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool lightTheme;

  const AppBarWidget({Key? key, this.lightTheme = true}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String get assetLogo => lightTheme ? AppImages.logoJournalHorizontalPurple : AppImages.logoJournalHorizontalWhite;
  Gradient? get gradient => lightTheme ? null : AppGradients.kBlueGradientAppBar;
  Brightness get statusBarIconBrightness => lightTheme ? Brightness.dark : Brightness.light;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.039),
          child: SvgPicture.asset(
            assetLogo,
            width: screenWidth / 3,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.kTransparent,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.kTransparent,
          statusBarIconBrightness: statusBarIconBrightness,
        ),
      ),
    );
  }
}
