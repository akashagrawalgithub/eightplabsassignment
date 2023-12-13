import 'package:assignmet/API_request/userdeatilsapi.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int? userId;
  String? username;
  String? auth;
  String? useremail;
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    getalldata();
  }

  void getalldata() async {
    try {
      final userdetails = await getuserdata().getUserDetails();
      setState(() {
        userId = userdetails['id'];
        username = userdetails["login"];
        auth = userdetails["authorities"][0];
        useremail = userdetails["email"];
        isloading = false;
      });
      print(userdetails);
    } catch (e) {
      print("something went wrong>>>>>>>>>>>>. ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isloading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF000000),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(20.0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDataRow("ID", "$userId"),
                    buildDataRow("User name", "$username"),
                    buildDataRow("Email", "$useremail"),
                    buildDataRow("Authorities", "$auth"),
                  ],
                ),
              ),
      ),
    );
  }

  Widget buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$label :",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 20),
          Text(value),
        ],
      ),
    );
  }
}
