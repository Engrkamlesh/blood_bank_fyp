// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:blood_bank_fyp/components/google.dart';
import 'package:blood_bank_fyp/utils/app_color.dart';
import 'package:blood_bank_fyp/utils/toastMassage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/profile_icon.dart';

class Profile_View extends StatefulWidget {
  const Profile_View({Key? key}) : super(key: key);

  @override
  State<Profile_View> createState() => _Profile_ViewState();
}

class _Profile_ViewState extends State<Profile_View> {
  String Name = '';
  String City = '';
  final firestore =
  FirebaseFirestore.instance.collection('Data');
  User? userid = FirebaseAuth.instance.currentUser;
  Future _getcurrentUser ()async{
    try{
        DocumentSnapshot ds = await firestore.doc(userid!.uid).get();
        setState(() {
          Name = ds.get('name');
          City = ds.get('email');
        });
    }catch(e){
      Utils().ToastMassage(e.toString());
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getcurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor:AppColor.bgColor,
        elevation: 0.5,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios , color: Colors.black,),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('images/user.png', width: 100, height: 100,),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                'Kamlesh'.text.size(30).make(),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.red, ),
                    SizedBox(width: 5,),
                    'Karachi'.text.gray600.size(16).make(),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal[500],
                            // border: Border.all(width: 1),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person_outline, color: Colors.white,),
                              SizedBox(width: 5,),
                              "Call Now".text.white.make(),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Google_Map()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink[500],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on_outlined, color: Colors.white,),
                              "Location".text.white.make()
                            ],
                          ),
                        ),
                      )
                    ],),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ListTile(
                  leading: Icon(Icons.event_available, color: Colors.red,),
                  title: Text("Available for donate"),
                ),
                ListTile(
                  leading: Icon(Icons.insert_invitation, color: Colors.red,),
                  title: Text("Invite a friend"),
                ),
                ListTile(
                  leading: Icon(Icons.logout_outlined, color: Colors.red,),
                  title: Text("Sign out"),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
