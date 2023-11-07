// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hellocalculator/widgets/calc_buttons.dart';
import 'package:hellocalculator/widgets/color.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userOperation = '';
  var userAnswer = '';

  //liste pour les différents boutons...
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.tertiary_color,
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userOperation,
                      style: GoogleFonts.rowdies(
                        fontSize: 20,
                      ),
                    )),
                Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: GoogleFonts.rowdies(
                        fontSize: 20,
                      ),
                    ))
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, index) {

                        //bouton effacer tous...
                        if (index == 0) {
                          return Button(
                            buttonText: buttons[index],
                            color: color.green_button,
                            textColor: Colors.white,
                            buttonTapped: () {
                              setState(() {
                                userOperation = '';
                              });
                            },
                          );
                        } 
                        
                        //bouton supprimer...
                        else if (index == 1) {
                          return Button(
                            buttonText: buttons[index],
                            color: color.red_button,
                            textColor: Colors.white,
                            buttonTapped: () {
                              setState(() {
                                userOperation = userOperation.substring(
                                    0, userOperation.length - 1);
                              });
                            },
                          );
                        }

                        //bouton égal...
                        else if (index == buttons.length-1) {
                          return Button(
                            buttonText: buttons[index],
                            color: color.primary_color,
                            textColor: Colors.white,
                            buttonTapped: () {
                              setState(() {
                               equalPressed();
                              });
                            },
                          );
                        }

                        //les autres boutons...
                         else {
                          return Button(
                            buttonTapped: () {
                              setState(() {
                                userOperation += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? color.primary_color
                                : Colors.white,
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : color.primary_color,
                          );
                        }
                      }))),
        ],
      ),
    );
  }

  //on vérifie que le bouton est un opérateur afin de lui attribuer certains attributs différents...
  bool isOperator(String value) {
    if (value == '%' ||
        value == '/' ||
        value == '+' ||
        value == '-' ||
        value == '=' ||
        value == 'x') {
      return true;
    }
    return false;
  }

  //méthode pour le boutton égal...
  void equalPressed(){
    String finalQuestion = userOperation;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }

}
