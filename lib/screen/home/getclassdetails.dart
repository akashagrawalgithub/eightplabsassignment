import 'package:flutter/material.dart';
import 'package:assignmet/API_request/getclassdataapi.dart';

class ClassDetails extends StatefulWidget {
  const ClassDetails({super.key});

  @override
  State<ClassDetails> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<ClassDetails> {
  List<Map<String, dynamic>> classDetails = [];
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    try {
      final List<dynamic> details = await getClassData().getClasses();
      setState(() {
        classDetails = details.cast<Map<String, dynamic>>();
        print(classDetails);
        isloading = false;
      });
    } catch (e) {
      print("Error: ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isloading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF0000000),
                ),
              )
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("User class details"),
                      const SizedBox(height: 20),
                      for (var classDetail in classDetails)
                        ClassContainer(classDetail),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class ClassContainer extends StatelessWidget {
  final Map<String, dynamic> classDetail;

  ClassContainer(this.classDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Class Name: ${classDetail['className']}"),
            Text("Class Long Name: ${classDetail['classLongName']}"),
            Text("Group Name: ${classDetail['school']['groupName']}"),
            Text("School Name: ${classDetail['school']['schoolName']}"),
            if (classDetail['tenant'] is Map<String, dynamic>)
              Text("Tenant Name: ${classDetail['tenant']['tenantName']}"),
          ],
        ),
      ),
    );
  }
}
