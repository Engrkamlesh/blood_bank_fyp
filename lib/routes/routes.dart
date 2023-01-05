// ignore_for_file: prefer_const_constructors
import 'package:blood_bank_fyp/routes/routes_name.dart';
import 'package:blood_bank_fyp/view/homescreen_view.dart';
import 'package:blood_bank_fyp/view/add_request_view.dart';
import 'package:blood_bank_fyp/view/donor_view.dart';
import 'package:blood_bank_fyp/view/donate_form.dart';
import 'package:blood_bank_fyp/view/login_screen.dart';
import 'package:blood_bank_fyp/view/profile_view.dart';
import 'package:blood_bank_fyp/view/register_form.dart';
import 'package:blood_bank_fyp/view/request_view.dart';
import 'package:blood_bank_fyp/view/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.register:
        return MaterialPageRoute(builder: (context) => Register_Form());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => Home_Screen_View());
      case RoutesName.request:
        return MaterialPageRoute(builder: (context) => Request_View());
      case RoutesName.addrequest:
        return MaterialPageRoute(builder: (context) => Add_Blood_Request());
      case RoutesName.profile:
        return MaterialPageRoute(builder: (context) => Profile_View());
      case RoutesName.donor:
        return MaterialPageRoute(builder: (context) => Donor_View());
      case RoutesName.donate:
        return MaterialPageRoute(builder: (context) => Donate_Form());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colors.black,),
            ),
          );
        });
    }
  }
}
