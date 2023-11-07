import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  const Button(
      {super.key,
      required this.color,
      required this.textColor,
      required this.buttonText,
      required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(buttonText, style: GoogleFonts.rowdies(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
