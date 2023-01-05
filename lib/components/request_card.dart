// ignore_for_file: sized_box_for_whitespace, camel_case_types

import 'package:blood_bank_fyp/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Request_Card extends StatelessWidget {
  const Request_Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Container(
        height: 80,
        child: ListTile(
          leading:
        Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.cyanAccent,
                    image: DecorationImage(image: AssetImage('images/user.png',),
                        fit: BoxFit.cover
                    )
                ),
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
                        border: Border.all(color: Colors.white,width: 2)),
                    child: Center(
                      child: Text('A+',style:GoogleFonts.openSans(
                      textStyle: const TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    ),
                  ))
            ],
          ),
          title:Text(
            'Kamlesh',
            style:GoogleFonts.openSans(
                  textStyle: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600),
          )),
          subtitle:
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColor.iconColor,
                size: 15,
              ),
              // SizedBox(width: 5),
              Text('Mirpur khas', style:GoogleFonts.openSans(
                textStyle: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w200),
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
                      border: Border.all(color: Colors.black26),
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.phone,color: Colors.white,size: 15,),
                          Text('Call',style:GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: AppColor.whiteColor,fontSize: 12, fontWeight: FontWeight.w600),
                    ),),
                        ],
                      ),
                    ),
                  )
              ),
              const SizedBox(height: 6),
              Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.location_on_outlined,color: Colors.white,size: 15,),
                          Text('Map',style:GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: AppColor.whiteColor,fontSize: 12, fontWeight: FontWeight.w600),
                          ),),
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      )
    );
  }
}

