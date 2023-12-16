import "package:assignmet/screen/startpage/onboarding.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.6,
              right: 30,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF2CB4EC),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.3,
              left: 30,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFFFD037),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.1,
              left: -55,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFFFD037),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.2,
              right: -55,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF2CB4EC),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.45,
              left: 55,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFE14B5A),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset("images/first.png"),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome to Learner',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF161C2B),
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt dolore magna aliqua',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6F6F79),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      Get.to(() => const OnboardingPage());
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF4E74F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3D000000),
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x1E000000),
                            blurRadius: 2,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: const Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
