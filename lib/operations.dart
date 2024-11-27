import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/addition.dart';
import 'package:test/division.dart';
import 'package:test/multiplication.dart';
import 'package:test/subtraction.dart';


class OperationsPage extends StatefulWidget {
  const OperationsPage({super.key});

  @override
  State<OperationsPage> createState() => _OperationsPageState();
}

class _OperationsPageState extends State<OperationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color:Color(0xFFffffff)),
        backgroundColor: Colors.transparent,
        title: Text('Math for Kids'),
        titleTextStyle: GoogleFonts.concertOne(fontSize: 20, color:Color(0xFFffffff),fontWeight: FontWeight.w600),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child:ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 360.0, 
              maxHeight: 740.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                    Color(0xFF203f8b),
                    Color(0xFF1068c9),
                    Color(0xFF1c78db)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Learn Math Operations!',
                      style: GoogleFonts.concertOne(fontSize: 28, color: Color(0xFFffffff), fontWeight: FontWeight.w600),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                            return AdditionPage();
                                          }
                                          ),
                                        );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFCC66FF),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(2.0,2.0),
                                    blurRadius: 8.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                              ),
                              child: FittedBox(
                                child: Column(
                                  children: [
                                    Text('+',
                                    style: GoogleFonts.concertOne(color:Color(0xFFffffff)),),
                                  ],
                                ),
                              ),
                            ),
                          Positioned(
                            right: 68.0,
                            bottom: 5.0,
                                  child: Transform.flip(
                                    flipX: true,
                                    child: Image.asset('assets/kid6.png',
                                    width: 120,
                                    height: 120,),
                                  ),
                                ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                            return SubtractionPage();
                                          }
                                          ),
                                        );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFCC00),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(2.0,2.0),
                                    blurRadius: 8.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                              ),
                              child: FittedBox(
                                child: Text('-',
                                style: GoogleFonts.concertOne(color:Color(0xFFffffff),fontWeight: FontWeight.w500),),
                              ),
                            ),
                          Positioned(
                            left: 68.0,
                            bottom: 5.0,
                                  child: Transform.flip(
                                    flipX: true,
                                    child: Image.asset('assets/kid8.png',
                                    width: 120,
                                    height: 120,),
                                  ),
                                ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                            return MultiplicationPage();
                                          }
                                          ),
                                        );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFF66CCFF),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(2.0,2.0),
                                    blurRadius: 8.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                              ),
                              child: FittedBox(
                                child: Text('x',
                                style: GoogleFonts.concertOne(color:Color(0xFFffffff),fontWeight: FontWeight.w500),),
                              ),
                            ),
                          Positioned(
                            right: 68.0,
                            bottom: 5.0,
                                  child: Transform.flip(
                                    flipX: true,
                                    child: Image.asset('assets/kid7.png',
                                    width: 120,
                                    height: 120,),
                                  ),
                                ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                            return DivisionPage();
                                          }
                                          ),
                                        );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF6600),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(2.0,2.0),
                                    blurRadius: 8.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                              ),
                              child: FittedBox(
                                child: Text('÷',
                                style: GoogleFonts.concertOne(color:Color(0xFFffffff),fontWeight: FontWeight.w500),),
                              ),
                            ),
                          Positioned(
                            left: 68.0,
                            bottom: 5.0,
                                  child: Transform.flip(
                                    flipX: true,
                                    child: Image.asset('assets/kid5.png',
                                    width: 120,
                                    height: 120,),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),),
                ),
        ),
      )
    );
  }
}