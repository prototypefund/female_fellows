import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_step1.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_step2.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_step3.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_step4.dart';
import 'package:vs_femalefellows/pages/Onboarding/onboarding_end.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  //keep track of pages
  PageController _controller = PageController();

  int currentPage = 0;

  //keep track of last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor:  Color.fromRGBO(252, 208, 220, 1),),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(252, 208, 220, 1),
        body: Stack(
          children: [
            //Logo
            Container(
              height: 100,
              width: 1000,
              color: Color.fromRGBO(252, 208, 220, 1),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 25),
                child: Image.asset('lib/images/FF-Logo_blau-1.png',
                    alignment: Alignment(0, -0.8)),
              ),
            ),
    
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == 4);
                  });
                },
                children: [
                  // Pages Onboarding
                  Page1(),
                  Page2(),
                  Page3(),
                  Page4(),
                  Page5(),
                ],
              ),
            ),
            //dot indicator
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: onLastPage
                  ? Container(
                      height: 60,
                      width: 1000,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 130),
                        child: GestureDetector(
                            onTap: () {
                              _controller.jumpTo(0);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.intro,
                            )),
                      ),
                    )
                  : Container(
                      color: Colors.transparent,
                      height: 60,
                      width: 1000,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                _controller.jumpToPage(5);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.skip,
                              )),
                          SmoothPageIndicator(
                            controller: _controller,
                            count: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(microseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.start,
                                ),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
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
