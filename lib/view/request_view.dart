// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:blood_bank_fyp/components/google.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/request_card.dart';
import '../utils/app_color.dart';

class Request_View extends StatefulWidget {
  const Request_View({Key? key}) : super(key: key);

  @override
  State<Request_View> createState() => _Request_ViewState();
}

class _Request_ViewState extends State<Request_View> {
  final firestore =
      FirebaseFirestore.instance.collection('Add_request').snapshots();

  @override
  Widget build(BuildContext context) {
    // final _height = MediaQuery.of(context).size.height * 0.8;
    // final _width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        title: Text(
          'Request',
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: AppColor.btxtColor, fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.greColor,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: firestore,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    CircularProgressIndicator();
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Stack(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.cyanAccent,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/user.png',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.bgColor,
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Center(
                                        child: Text(
                                          snapshot.data!.docs[index]['bloodgroup'],
                                          style: GoogleFonts.openSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            title: Text(snapshot.data!.docs[index]['name'].toString(),
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                            subtitle: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: AppColor.iconColor,
                                  size: 15,
                                ),
                                // SizedBox(width: 5),
                                Text(snapshot.data!.docs[index]['address'],
                                    style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200),
                                    )),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.phone,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            Text(
                                              'Call',
                                              style: GoogleFonts.openSans(
                                                textStyle: const TextStyle(
                                                    color: AppColor.whiteColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                const SizedBox(height: 6),
                                Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        color: Colors.pinkAccent,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Google_Map()));
                                          },
                                          child:
                                            Text(
                                              'Map',
                                              style: GoogleFonts.openSans(
                                                textStyle: const TextStyle(
                                                    color: AppColor.whiteColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),)
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          );
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
