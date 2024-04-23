import 'package:angelschein_lernen/feature/practice/practice_controller.dart';
import 'package:angelschein_lernen/feature/practice/practice_model.dart';
import 'package:angelschein_lernen/feature/questions/questions_model.dart';
import 'package:flutter/material.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

class PracticeView extends MViewC<PracticeController, PracticeModel> {
  const PracticeView({
    required super.controller,
    super.key,
  });

  Color getAnswerColor(QuestionModel currentQuestion) {
    if (currentQuestion.answerCorrect != null) {
      return currentQuestion.answerCorrect!
          ? Colors.greenAccent.withAlpha(120)
          : Colors.red.withAlpha(120);
    }
    return Colors.blueAccent.withAlpha(120);
  }

  @override
  Widget build(BuildContext context, PracticeModel model) {
    QuestionModel? currentQuestion;
    var answers = <String>[];

    if (model.currentQuestionIndex >= 0) {
      currentQuestion = model.lastQuestions[model.currentQuestionIndex];
      answers = <String>[
        currentQuestion.answer1,
        currentQuestion.answer2,
        currentQuestion.answer3,
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Übung'),
      ),
      body: model.lastQuestions.isEmpty || currentQuestion == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Card(
                  color: getAnswerColor(currentQuestion),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Content fits the card
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nr.${currentQuestion.id}: '
                          '${currentQuestion.question}'
                          ' (${currentQuestion.solution.length})',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (currentQuestion.fishpic != '')
                          Image.asset(controller.getCurrentFishPic()),
                        const SizedBox(
                          height: 10,
                        ), // Spacing between title/image and answers
                        Wrap(
                          spacing: 8, // Horizontal spacing between options
                          runSpacing: 15, // Verical spacing between options
                          children: List.generate(answers.length, (index) {
                            final isChecked = currentQuestion!.userAnswers
                                .contains(index + 1);
                            final answerIndex = index + 1;
                            return InkWell(
                              onTap: () {
                                controller.selectAnswer(
                                  newValue: !isChecked,
                                  index: answerIndex,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: isChecked,
                                      onChanged: (newValue) {
                                        controller.selectAnswer(
                                          newValue: newValue!,
                                          index: answerIndex,
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        answers[index],
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                LinearProgressIndicator(
                  value: model.lastQuestions.length / model.questions.length,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: controller.prevQuestion,
                        child: const Icon(Icons.arrow_back),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.checkAnswer()) {
                            Future.delayed(
                              const Duration(seconds: 1),
                              controller.nextQuestion,
                            );
                          }
                        },
                        child: const Icon(Icons.check),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('Bookmark');
                        },
                        child: const Icon(Icons.bookmark_border),
                      ),
                      ElevatedButton(
                        onPressed: controller.nextQuestion,
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
