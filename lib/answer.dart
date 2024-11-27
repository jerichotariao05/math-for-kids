import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final VoidCallback  answerTap;

  Answer({required this.answerText,required this.answerColor,required this.answerTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: answerTap,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Color(0xFFffffff),),
              borderRadius: BorderRadius.circular(12),
              color: answerColor,
            ),
            child: FittedBox(child: Text(answerText, style: GoogleFonts.concertOne(color: Color(0xFFffffff)))),
          ),
        );
  }
}
