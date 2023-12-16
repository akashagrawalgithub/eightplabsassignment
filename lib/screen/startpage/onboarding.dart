import "package:assignmet/screen/authentication/login.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.25,
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
                  top: MediaQuery.sizeOf(context).height * 0.6,
                  left: -25,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFE14B5A),
                      shape: OvalBorder(),
                    ),
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  child: Image.asset("images/second.png"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'Welcome to Lions School',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF161C2B),
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt dolore magna aliqua',
                          style: TextStyle(
                            color: Color(0xFF6F6F79),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const LoginPage());
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
                          'Next',
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
      ),
    );
  }
}
