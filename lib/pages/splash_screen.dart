import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hellocalculator/pages/home.dart';
import 'package:hellocalculator/widgets/color.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
     Future.delayed(const Duration(seconds: 7), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("lib/assets/calculator.json",
              width: 200, height: 200, fit: BoxFit.fill),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Hello Calculator !',
            textAlign: TextAlign.center,
            style: GoogleFonts.rowdies(
                fontSize: 30,
                color: color.primary_color,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          if (defaultTargetPlatform == TargetPlatform.iOS)
            const CupertinoActivityIndicator(
              color: color.primary_color,
              radius: 20,
            )
          else
            const CircularProgressIndicator(
              color: color.primary_color,
            )
        ],
      )),
    );
  }
}
