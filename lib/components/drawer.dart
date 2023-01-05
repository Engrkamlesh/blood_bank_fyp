// ignore_for_file: camel_case_types
import 'package:blood_bank_fyp/utils/app_color.dart';
import 'package:blood_bank_fyp/utils/toastMassage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes/routes_name.dart';

class Drawer_View extends StatelessWidget {
  const Drawer_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.bgColor,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: AppColor.draColor,
            ),
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: AppColor.draColor),
              accountName: Text('Kamlesh',style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),),
              accountEmail: Text('Kamlesh@gmail.com',style: GoogleFonts.openSans(textStyle: const TextStyle(fontSize: 15))),
              currentAccountPicture:  const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/user.png'),
              ),
            ),
          ),
          Build_List(
            title: 'Home',
            icon: 'images/dicon/home.png',
            ontap: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
          ),
          Build_List(
            title: 'Donation',
            icon: 'images/dicon/blood-drop.png',
            ontap: () {
              Navigator.pushNamed(context, RoutesName.donate);
            },
          ),
          Build_List(
            title: 'Add Request',
            icon: 'images/dicon/add_request.png',
            ontap: () {
              Navigator.pushNamed(context, RoutesName.addrequest);
            },
          ),
          Build_List(
            title: 'Request',
            icon: 'images/dicon/request.png',
            ontap: () {
              Navigator.pushNamed(context, RoutesName.request);
            },
          ),
          Build_List(
            title: 'Donor List',
            icon: 'images/dicon/reminder.png',
            ontap: () {
              Navigator.pushNamed(context, RoutesName.donor);
            },
          ),
          Build_List(
            title: 'Log Out',
            icon: 'images/dicon/logout.png',
            ontap: () {
              final auth = FirebaseAuth.instance;
              auth.signOut().then((value){
              Navigator.pushNamed(context, RoutesName.login);
              }).onError((error, stackTrace){
                Utils().ToastMassage(error.toString());
              });
            },
          ),
        ],
      ),
    );
  }
}

class Build_List extends StatelessWidget {
  final String title;
  final dynamic icon;
  final VoidCallback ontap;
  const Build_List(
      {Key? key, required this.title, required this.ontap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(
          icon,
          height: 25,
          width: 25,
          color: AppColor.iconColor,
        ),
        title: Text(
          title,
          style: GoogleFonts.openSans(textStyle:const TextStyle(color: AppColor.iconColor)),
        ),
        selected: true,
        onTap: ontap);
  }
}
