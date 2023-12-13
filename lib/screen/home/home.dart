import 'package:assignmet/screen/authentication/login.dart';
import 'package:assignmet/screen/home/getclassdetails.dart';
import 'package:assignmet/screen/home/getuserdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.people),
                        SizedBox(width: 15),
                        Text("Welcome to Home page"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.clear();
                        Get.offAll(const LoginPage());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF252525),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("Logout"),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(const UserProfile());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF252525),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("Get user Profile"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const ClassDetails());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF252525),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("Get Class Data"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
