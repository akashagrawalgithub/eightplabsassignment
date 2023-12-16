import 'package:assignmet/screen/home/home.dart';
import 'package:assignmet/screen/startpage/startpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:get/get.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _getTokenFromSharedPreferences(),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          }
          if (snapshot.hasData && snapshot.data != null) {
            return HomePage();
          } else {
            return const GetStarted();
          }
        },
      ),
    );
  }

  Future<String?> _getTokenFromSharedPreferences() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('jwt_token');
    } catch (e) {
      print('Error fetching shared preferences: $e');
      return null;
    }
  }
}
