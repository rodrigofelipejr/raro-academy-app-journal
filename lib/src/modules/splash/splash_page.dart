import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    SystemChrome.setEnabledSystemUIOverlays([]);
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushReplacementNamed(context, AppRoutes.kHome));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.kBlueGradient,
        ),
        child: Column(
          children: [
            Expanded(
              child: AnimatedCard(
                direction: AnimatedCardDirection.top,
                duration: Duration(seconds: 1),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 60),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 10.0),
                              child: Hero(
                                tag: 'hero_journal',
                                child: Text(
                                  'journal',
                                  style: AppTypography.white72w700Montserrat(),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 12.0,
                              child: Text(
                                'YOUR ACADEMY\'S BEST FRIEND',
                                style: AppTypography.white13w400Montserrat(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Hero(
                          tag: 'hero_logo_journal',
                          child: SvgPicture.asset(
                            AppImages.logoJournalIcon,
                            height: 90,
                            width: 90,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              duration: Duration(seconds: 1),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  children: [
                    Text(
                      'powered by',
                      style: AppTypography.whiteOpacity13w300Roboto(),
                    ),
                    SizedBox(height: 10.0),
                    SvgPicture.asset(
                      AppImages.logoRaroAcademy,
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
