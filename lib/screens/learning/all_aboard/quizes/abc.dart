import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/all_aboard/quiz_option.dart';
import 'package:flutter_application_1/components/confetti_component.dart';
import 'package:flutter_application_1/components/top_bar.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/helper/confetti_helper.dart';
import 'package:flutter_application_1/models/all_aboard/question.dart';

class AbcQuizScreen extends StatelessWidget {
  const AbcQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return AndroidWelcome(
          constraints: constraints,
        );
      }),
    );
  }
}

class AndroidWelcome extends StatefulWidget {
  const AndroidWelcome({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;

  @override
  State<AndroidWelcome> createState() => _AndroidWelcomeState();
}

class _AndroidWelcomeState extends State<AndroidWelcome> {
  final image = Assets.images.allAboard.letters.sample;
  late final List<Question> questions;

  int currentQuestionIndex = 0;
  List<int> randomizedIndices = [];
  List<int?> userAnswers = [];
  bool showResults = false;

  late ConfettiController _leftController;
  late ConfettiController _rightController;
  late ConfettiHelper _confettiHelper;

  @override
  void initState() {
    super.initState();

    questions = [
      Question(
        questionText: "Aa",
        imageOptions: [
          image.egg.path,
          image.lamb.path,
          image.penguin.path,
          image.apple.path,
        ],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: "Bb",
        imageOptions: [
          image.noodle.path,
          image.sun.path,
          image.ball.path,
          image.doll.path,
        ],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: "Cc",
        imageOptions: [
          image.zoo.path,
          image.cat.path,
          image.goat.path,
          image.xylophone.path,
        ],
        correctAnswerIndex: 1,
      ),
      // Add more questions here
      // kulang pa!
    ];

    randomizeCurrentQuestion();

    _leftController =
        ConfettiController(duration: const Duration(milliseconds: 1000));
    _rightController =
        ConfettiController(duration: const Duration(milliseconds: 1000));
    _confettiHelper = ConfettiHelper(_leftController, _rightController);
  }

  @override
  void dispose() {
    _confettiHelper.stopConfettiLoop(); // Stop the loop
    _confettiHelper.dispose(); // Dispose of controllers
    super.dispose();
  }

  void randomizeCurrentQuestion() {
    randomizedIndices = List.generate(
      questions[currentQuestionIndex].imageOptions.length,
      (index) => index,
    );
    randomizedIndices.shuffle(Random());
  }

  void handleAnswer(int selectedIndex) {
    setState(() {
      if (userAnswers.length <= currentQuestionIndex) {
        userAnswers.add(randomizedIndices[selectedIndex]);
      } else {
        userAnswers[currentQuestionIndex] = randomizedIndices[selectedIndex];
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        randomizeCurrentQuestion();
      });
    } else if (userAnswers.length == questions.length) {
      _confettiHelper
          .startConfettiLoop(); // Start confetti loop when results are shown
      setState(() {
        showResults = true;
      });
    }
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers.length > i &&
          userAnswers[i] == questions[i].correctAnswerIndex) {
        score++;
      }
    }
    return score;
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      userAnswers.clear();
      showResults = false;
      randomizeCurrentQuestion();
      _confettiHelper.stopConfettiLoop(); // Stop confetti when restarting
    });
  }

  void close() {
    return Navigator.of(context).pop();
  }

  Widget buildResultsScreen() {
    final score = calculateScore();
    final percentage = (score / questions.length * 100).round();
    return Stack(
      children: [
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Quiz Complete!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$score/${questions.length}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$percentage%',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Show answers review
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    final userAnswer = userAnswers[index];
                    final isCorrect = userAnswer == question.correctAnswerIndex;

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: ListTile(
                        leading: Icon(
                          isCorrect ? Icons.check_circle : Icons.cancel,
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                        title: Text(question.questionText),
                        trailing: SizedBox(
                          width: 100,
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  question.imageOptions[userAnswer ?? 0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (!isCorrect) ...[
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Image.asset(
                                    question.imageOptions[
                                        question.correctAnswerIndex],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: restartQuiz,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Center-left confetti
        Align(
          alignment: Alignment.centerLeft,
          child: ConfettiComponent(
            controller: _leftController,
            blastDirection: -3.14 / 4, // Default direction for left
          ),
        ),
        // Center-right confetti
        Align(
          alignment: Alignment.centerRight,
          child: ConfettiComponent(
            controller: _rightController,
            blastDirection: -3.14 * 3 / 4, // Default direction for right
          ),
        ),
      ],
    );
  }

  Widget buildQuizScreen() {
    Question currentQuestion = questions[currentQuestionIndex];
    bool hasAnswered = userAnswers.length > currentQuestionIndex &&
        userAnswers[currentQuestionIndex] != null;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const TopBar(),
          const Spacer(),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: widget.constraints.maxWidth * .10,
              vertical: widget.constraints.maxHeight * .02,
            ),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                widget.constraints.maxWidth * .04,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(widget.constraints.maxWidth * .03),
              child: Column(
                children: [
                  Text(
                    currentQuestion.questionText,
                    style: TextStyle(
                      color: const Color(0xff6F53FD),
                      fontSize: widget.constraints.maxHeight * .15,
                      height: 1.0,
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(
                      currentQuestion.imageOptions.length,
                      (index) => GestureDetector(
                        onTap: () => handleAnswer(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff95E9FF),
                            border: Border.all(
                              color: hasAnswered &&
                                      randomizedIndices[index] ==
                                          userAnswers[currentQuestionIndex]
                                  ? Colors.amber
                                  : Colors.grey,
                              width: hasAnswered &&
                                      randomizedIndices[index] ==
                                          userAnswers[currentQuestionIndex]
                                  ? 4
                                  : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              currentQuestion
                                  .imageOptions[randomizedIndices[index]],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NiceButton(
                        width: constraints.maxWidth * .9,
                        isIconRight: true,
                        label: currentQuestionIndex == questions.length - 1
                            ? 'Finish'
                            : 'Next',
                        color: const Color.fromARGB(255, 87, 210, 91),
                        shadowColor: Colors.green[800]!,
                        icon: Icons.arrow_forward,
                        iconSize: 30,
                        enabled: hasAnswered,
                        method: hasAnswered ? nextQuestion : null,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          // const Spacer(),

          const Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(bottom: 20.0, right: 50),
          //       child: Image.asset(
          //         'assets/images/dog.png',
          //         height: widget.constraints.maxHeight * 0.17,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        image: DecorationImage(
          image: Assets.images.background.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: showResults ? buildResultsScreen() : buildQuizScreen(),
    );
  }
}
