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
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Register Now",
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
                  'Create an account to access the app',
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
                    controller: _namecontroller,
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
                  'Email Address',
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
                      hintText: "abc@gmail.com",
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
                      hintText: "Password@123",
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
                  'Confirm Password',
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
                    controller: _repasswordcontroller,
                    decoration: const InputDecoration(
                      hintText: "Password@123",
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
                        final success = await registrationService.registerUser(
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
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(const LoginPage());
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
