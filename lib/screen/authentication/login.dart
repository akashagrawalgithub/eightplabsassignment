import "package:assignmet/API_request/loginapi.dart";
import "package:assignmet/screen/authentication/register.dart";
import "package:assignmet/screen/home/home.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void initState() {
    islogin();
    super.initState();
  }

  void islogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jwtToken = prefs.getString('jwt_token');
    print(jwtToken);
  }

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
                      "Login Now",
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
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () async {
                      if (_emailcontroller.text.isEmpty ||
                          _passwordcontroller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please Enter all your details",
                            ),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      } else {
                        try {
                          final loginService = LoginService();
                          final token = await loginService.loginUser(
                            username: _emailcontroller.text,
                            password: _passwordcontroller.text,
                          );
                          Get.offAll(HomePage());
                          print(token);
                        } catch (e) {
                          print("something went wrong>>>>>>>>>>>> login");
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
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.to(const Registerpage());
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
