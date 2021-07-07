import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal/src/shared/constants/app_colors.dart';
import 'package:journal/src/shared/constants/contsnates.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.kBlueGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 40.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 60),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 10.0),
                              child: Text(
                                'journal',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 72.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 12.0,
                              child: Text(
                                'YOUR ACADEMY\'S BEST FRIEND',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    letterSpacing: 1.0,
                                    // fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: SvgPicture.asset(
                          AppImages.logoJournalIcon,
                          height: 90,
                          width: 90,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  AppImages.logoRaroAcademy,
                  height: 100,
                  width: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
