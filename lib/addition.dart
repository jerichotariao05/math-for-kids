import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/answer.dart';

class AdditionPage extends StatefulWidget {
  const AdditionPage({super.key});

  @override
  State<AdditionPage> createState() => _AdditionPageState();
}

class _AdditionPageState extends State<AdditionPage> {

  List<Icon> _scoreTracker = [];

  int _questionIndex = 0;
  int _totalScore = 0;
  bool optionSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;
  bool correctAnswer = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      optionSelected = true;
      if (answerScore) {
        //add score
        _totalScore++;
        correctAnswer = true;
      }
      _scoreTracker.add(
        answerScore
            ? Icon(
                //if correct
                Icons.star_rounded,
                color: Colors.yellow,
                size: 20,
              )
            : Icon(
                Icons.clear, //if wrong
                color: Colors.red,
                size: 20,
              ),
      );
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      //proceed to the next question
      _questionIndex++;
      //return the selection to the original color
      optionSelected = false;
      correctAnswer = false;
      _answerReply = '';
    });
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
      _answerReply = 'Yey!\n Addition';
    });
  }

String _answerReply = 'Yey!\n Addition';

void _updateAnswerReply() {
  if (correctAnswer && !endOfQuiz) {
    _answerReply = "You got\nit!";
  } else if (!correctAnswer && !endOfQuiz) {
    _answerReply = "Oops, not\nquite!";
  } 
}

void _endQuizReply(){
  if (endOfQuiz && _totalScore >= 5) {
    _answerReply = " Great\njob!";
  } else {
    _answerReply = "Better luck\nnext time!";
  }
}

  @override
  Widget build(BuildContext context) {

  if (optionSelected && !endOfQuiz) {
      _updateAnswerReply();
    }

  if(endOfQuiz){
    _endQuizReply();
  }

    return DefaultTextStyle(
      style: GoogleFonts.concertOne(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFFffffff)),
          backgroundColor: Colors.transparent,
          title: Text(
            'Math for Kids',
            style: GoogleFonts.concertOne(
                fontSize: 20,
                color: Color(0xFFffffff),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 360.0,
              maxHeight: 740.0,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF203f8b),
                    Color(0xFF1068c9),
                    Color(0xFF1c78db),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    children: [
                      Text(
                        'Find the sum',
                        style: GoogleFonts.concertOne(
                            fontSize: 32,
                            color: Color(0xFFffffff),
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          //start of the game, if the score is 0
                          if (_scoreTracker.length == 0) SizedBox(height: 20),
                          if (_scoreTracker.length > 0) ..._scoreTracker
                        ],
                      ),
                      Container(
                        width: 350.0,
                        height: 220.0,
                        decoration: BoxDecoration(
                          border: Border.all(width: 10, color: Color(0xFF996633)),
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF006600),
                              Color(0xFF008000),
                              Color(0xFF009900),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: FittedBox(
                            child: Text(
                              (_questions[_questionIndex]['question'] as String),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.concertOne(color: Color(0xFFffffff)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...(_questions[_questionIndex]['answers'] as List<Map<String, dynamic>>)
                              .map(
                                (answer) => Answer(
                                  answerText: answer['answerText'],
                                  answerColor: optionSelected
                                      ? answer['score']
                                          ? Color(0xFF28a745)
                                          : Color(0xFFdc3545)
                                      : Color(0xFFCC66FF),
                                  answerTap: () {
                                    if (optionSelected) {
                                      return;
                                    }
                                    _questionAnswered(answer['score']);
                                  },
                                ),
                              ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 330,
                            height: 40,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(0xFFffffff),
                                backgroundColor: Color(0xFF007bff),
                                side: BorderSide(color: Color(0xFFffffff), width: 5),
                              ),
                              onPressed: () {
                                if (!optionSelected) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("You can't skip the question"),
                                    ),
                                  );
                                  return;
                                }
                                _nextQuestion();
                              },
                              child: Text(
                                endOfQuiz ? 'Play again?' : 'Next question',
                                style: GoogleFonts.concertOne(fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 10.0,
                                    height: 10.0,
                                    child: Text(''),
                                  ),
                                ],
                              ),
                              Positioned(
                                left: -10,
                                bottom: -190,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/kid2Chatting.png',
                                      width: 260,
                                      height: 260,
                                    )
                                  ],
                                ),
                              ),
                                Positioned(
                                  top: 30,
                                  right: -182,
                                  child: RotationTransition(
                                    turns: AlwaysStoppedAnimation(24 / 360),
                                    child: FittedBox(
                                      child: Container(
                                        height: 100,
                                        width: 160,
                                        child: Text(
                                            _answerReply,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.concertOne(fontSize: 26, color: Color(0xFF000000)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Positioned(
                                right: -300,
                                bottom: -130,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Score:',
                                      style: GoogleFonts.concertOne(fontSize: 40, color: Color(0xFFffffff)),
                                    ),
                                    Text(
                                      '$_totalScore/${_questions.length}',
                                      style: GoogleFonts.concertOne(fontSize: 40, color: Color(0xFFffffff)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final _questions = const [
  //index 1 or question 1
  {
    'question': '1+1',
    'answers': [
      {'answerText': '3', 'score': false},
      {'answerText': '2', 'score': true},
      {'answerText': '1', 'score': false},
    ],
  },
  {
    'question': '4+5',
    'answers': [
      {'answerText': '9', 'score': true},
      {'answerText': '8', 'score': false},
      {'answerText': '12', 'score': false},
    ],
  },
  {
    'question': '7+3',
    'answers': [
      {'answerText': '5', 'score': false},
      {'answerText': '16', 'score': false},
      {'answerText': '10', 'score': true},
    ],
  },
  {
    'question': '9+4',
    'answers': [
      {'answerText': '15', 'score': false},
      {'answerText': '7', 'score': false},
      {'answerText': '13', 'score': true},
    ],
  },
  {
    'question': '7+8',
    'answers': [
      {'answerText': '10', 'score': false},
      {'answerText': '15', 'score': true},
      {'answerText': '19', 'score': false},
    ],
  },
  {
    'question': '6+11',
    'answers': [
      {'answerText': '12', 'score': false},
      {'answerText': '18', 'score': false},
      {'answerText': '17', 'score': true},
    ],
  },
  {
    'question': '14+6',
    'answers': [
      {'answerText': '20', 'score': true},
      {'answerText': '18', 'score': false},
      {'answerText': '15', 'score': false},
    ],
  },
  {
    'question': '9+9',
    'answers': [
      {'answerText': '17', 'score': false},
      {'answerText': '21', 'score': false},
      {'answerText': '18', 'score': true},
    ],
  },
  {
    'question': '11+3',
    'answers': [
      {'answerText': '14', 'score': true},
      {'answerText': '10', 'score': false},
      {'answerText': '17', 'score': false},
    ],
  },
  {
    'question': '18+4',
    'answers': [
      {'answerText': '25', 'score': false},
      {'answerText': '22', 'score': true},
      {'answerText': '28', 'score': false},
    ],
  },
];

