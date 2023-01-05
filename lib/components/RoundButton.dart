import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {

  final String text;
  final Color? color;
  final VoidCallback onPress;
  final bool leading ;
RoundButton({Key? key,
required this.text, this.color,
 required this.onPress,
 this.leading = false
}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          maximumSize: MaterialStateProperty.all(const Size.fromHeight(40)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          // side: MaterialStateProperty.all(BorderSide(color: Colors.black))
      ),
      onPressed: onPress,
      child: Center(child:leading ? CircularProgressIndicator(color: Colors.white,): Text(text, style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w400)),))
    );
  }
}
