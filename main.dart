import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizApp());
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}


class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      'question': "Who is the founder of microsoft?",
      'options': ['Steve Jobs', 'Elon Musk', 'Bill Gates', 'Lary Page'],
      'correctAnswer': 2,
    },
    {
      'question': "Who is the founder of Apple?",
      'options': ['Steve Jobs', 'Elon Musk', 'Bill Gates', 'Lary Page'],
      'correctAnswer': 0,
    },
    {
      'question': "Who is the founder of Google?",
      'options': ['Steve Jobs', 'Elon Musk', 'Bill Gates', 'Lary Page'],
      'correctAnswer': 3,
    },
    {
      'question': "Who is the founder of OpenAI?",
      'options': ['Steve Jobs', 'Elon Musk', 'Bill Gates', 'Lary Page'],
      'correctAnswer': 0,
    },
    {
      'question': "Who is the founder of SpaceX?",
      'options': ['Steve Jobs', 'Elon Musk', 'Bill Gates', 'Lary Page'],
      'correctAnswer': 1,
    },
  ];
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  bool isQuestionPage = true;
  int score = 0;

  WidgetStatePropertyAll<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]['correctAnswer']) {
        return WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return WidgetStatePropertyAll(Colors.red);
      } else {
        return WidgetStatePropertyAll(null);
      }
    } else {
      return WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return quizAppPage();
  }

  Scaffold quizAppPage() {
    if (isQuestionPage == true) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 120),
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 380,
              child: Text(
                allQuestions[currentQuestionIndex]['question'],
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(0)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;

                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]['correctAnswer']) {
                      score++;
                    }

                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][0],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(1)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;

                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]['correctAnswer']) {
                      score++;
                    }

                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][1],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(2)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;

                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]['correctAnswer']) {
                      score++;
                    }

                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][2],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(3)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;

                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]['correctAnswer']) {
                      score++;
                    }

                    setState(() {});
                  }
                },
                child: Text(
                  allQuestions[currentQuestionIndex]['options'][3],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedAnswerIndex != -1) {
              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
                selectedAnswerIndex = -1;
              } else {
                isQuestionPage = false;
              }
              setState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Please select an option"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          backgroundColor: Colors.purple,
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text("Result Screen", style: TextStyle(fontSize: 30)),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Congratualtions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROHTmpMV0Z0ifA2JUJvw53dLEj2Tjxlkg1lQ&s",
                width: 500,
                height: 500,
              ),
              SizedBox(height: 30),
              Text(
                "Your Score:$score/${allQuestions.length}",

                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      );
    }
  }
}
