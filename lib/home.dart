import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/Operations.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg1.png'),
        fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Center(
          child: ConstrainedBox(
            constraints: 
            BoxConstraints(
              maxWidth: 360.0, 
              maxHeight: 740.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 120.0, 10.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                  Positioned(
                    left: -40,
                    top: -112,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Text('MATH',
                            style: GoogleFonts.luckiestGuy(fontSize: 112,color: Color(0xFFFFCC00),),),
                        Positioned(
                          top:-62,
                          right: 200,
                          child: Transform.flip(
                            flipX: true,
                            child: Image.asset('assets/kid6.png',
                            width: 140,
                            height: 140,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: -10,
                    bottom: -112,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Text('KIDS',
                          style: GoogleFonts.luckiestGuy(fontSize: 112,color: Color(0xFF66CCFF),),),
                        Positioned(
                          top:-62,
                          right: 176,
                          child: Transform.flip(
                            flipX: true,
                            child: Image.asset('assets/kid7.png',
                            width: 140,
                            height: 140,),
                          ),
                        ),
                        Positioned(
                          left: 160,
                          bottom: -62,
                          child: Image.asset('assets/kid5.png',
                          width: 140,
                          height: 140,),
                        ),
                        
                      ],
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text('FOR',
                        style: GoogleFonts.luckiestGuy(fontSize: 112,color: Color(0xFFFffffff),),),
                      Positioned(
                        left: 140,
                        bottom: 38,
                        child: Transform.flip(
                          flipX: true,
                          child: Image.asset('assets/kid8.png',
                          width: 140,
                          height: 140,),
                        ),
                      ),
                    ],
                  ),
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180.0,
                        child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFFffffff),
                        backgroundColor: Color(0xFFdc3545),
                        side: BorderSide(color: Color(0xFFffffff), width: 5),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                            return OperationsPage();
                                          }
                                          ),
                                        );
                                      },
                                      child: Text('Play', style: GoogleFonts.concertOne(fontSize: 32.0),
                                      ),
                                    ),
                      ),
                    ],
                  ),
                ],
                ),
            ),
            ),
        ),
      ),
    );
  }
}
