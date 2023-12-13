import "package:assignmet/API_request/registerapi.dart";
import "package:assignmet/screen/authentication/login.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _namecontroller = TextEditingController();
  final _repasswordcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Register Now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF252525),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _namecontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter the Username",
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _emailcontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter the Email",
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _passwordcontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter your password",
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _repasswordcontroller,
                      decoration: const InputDecoration(
                        hintText: "Re Enter your password",
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () async {
                      if (_namecontroller.text.isEmpty ||
                          _passwordcontroller.text.isEmpty ||
                          _emailcontroller.text.isEmpty ||
                          _repasswordcontroller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please Enter all your details",
                            ),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      } else if (_passwordcontroller.text !=
                          _repasswordcontroller.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please check the password",
                            ),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      } else {
                        try {
                          final registrationService = RegistrationService();
                          final success =
                              await registrationService.registerUser(
                            login: _namecontroller.text,
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text,
                            langKey: 'en',
                          );
                          if (success) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Accout created Succesfully Login now",
                                ),
                                duration: Duration(seconds: 5),
                              ),
                            );
                            Get.to(const LoginPage());
                          } else {
                            print('User registration failed.');
                          }
                        } catch (e) {
                          print("something went wrong");
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                      decoration: const BoxDecoration(
                        color: Color(0xFF252525),
                      ),
                      child: const Center(
                        child: Text(
                          "Register Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(
                              0xFFFFFFFF,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.to(const LoginPage());
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                      decoration: const BoxDecoration(
                        color: Color(0xFF252525),
                      ),
                      child: const Center(
                        child: Text(
                          "Login Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(
                              0xFFFFFFFF,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
