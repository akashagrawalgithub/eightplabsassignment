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
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Login Now",
                  style: TextStyle(
                    color: Color(0xFF161C2B),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Enter details to access your account',
                style: TextStyle(
                  color: Color(0xFF4E74F9),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Username',
                style: TextStyle(
                  color: Color(0xFF161C2B),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFE9E9F1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                    hintText: "Akash07",
                    contentPadding: EdgeInsets.only(left: 10),
                    helperStyle: TextStyle(
                      color: Color(0xFFA3A3AE),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(
                  color: Color(0xFF161C2B),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFE9E9F1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: TextField(
                  controller: _passwordcontroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "abc@123",
                    helperStyle: TextStyle(
                      color: Color(0xFFA3A3AE),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                  padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
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
                  child: const Center(
                    child: Text(
                      "Login Now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
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
                  padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
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
                  child: const Center(
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
