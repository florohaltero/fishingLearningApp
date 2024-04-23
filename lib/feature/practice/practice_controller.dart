import 'dart:math';

import 'package:angelschein_lernen/feature/practice/practice_model.dart';
import 'package:angelschein_lernen/feature/questions/questions_controller.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

abstract class PracticeController extends MVController<PracticeModel> {
  PracticeController(super.initialModel);
  void nextQuestion();

  void prevQuestion();

  void selectAnswer({required bool newValue, required int index});

  bool checkAnswer();

  String getCurrentFishPic();
}

class PracticeControllerImplementation extends PracticeController {
  PracticeControllerImplementation(int categoryIndex)
      : super(
          PracticeModel(
            categoryIndex: categoryIndex,
          ),
        ) {
    /*TODO: Is this right way to have a
       controller in a controller or use dependency injection?
     */

    initQuestions(categoryIndex);
    // final questionsController =
    // QuestionsControllerImplementation(categoryIndex);
    // questionsController.loadQuestions(categoryIndex);
    // final questions = questionsController.model.questions;
    // final randomIndex = Random().nextInt(model.questions.length) + 1;
    //
    // model.lastQuestions.add(model.questions[randomIndex]);
    //
    //
    // model = model.copyWith(
    //   currentQuestionIndex: 0,
    //   questions: questions,
    //   lastQuestions: model.lastQuestions,
    // );
  }

  Future<void> initQuestions(int categoryIndex) async {
    final questionsController =
        QuestionsControllerImplementation(categoryIndex);
    await questionsController.loadQuestions(categoryIndex);
    final questions = questionsController.model.questions;
    final randomIndex = Random().nextInt(questions.length) + 1;

    model = model.copyWith(
      currentQuestionIndex: 0,
      questions: questions,
      lastQuestions: [questions[randomIndex]],
    );
  }

  @override
  void nextQuestion() {
    int randomIndex;
    do {
      randomIndex = Random().nextInt(model.questions.length) + 1;
    } while (model.lastQuestions
        .where(
          (element) => element.id == randomIndex,
        )
        .isNotEmpty);
    final currentQuestion = model.questions[randomIndex];
    model.lastQuestions.add(currentQuestion);

    // Update the model
    model = model.copyWith(
      currentQuestionIndex: model.lastQuestions.length - 1,
      lastQuestions: model.lastQuestions,
    );
  }

  @override
  void prevQuestion() {
    if (model.currentQuestionIndex <= 0) {
      return;
    }

    model = model.copyWith(
      currentQuestionIndex: model.currentQuestionIndex - 1,
    );
  }

  @override
  void selectAnswer({required bool newValue, required int index}) {
    final currentQuestion = model.lastQuestions[model.currentQuestionIndex];
    final userAnswers = currentQuestion.userAnswers.toSet();
    if (newValue) {
      userAnswers.add(index);
    } else {
      userAnswers.remove(index);
    }

    model = model.copyWith(
      lastQuestions: model.lastQuestions.asMap().entries.map((entry) {
        if (entry.key == model.currentQuestionIndex) {
          return entry.value.copyWith(userAnswers: userAnswers);
        }
        return entry.value;
      }).toList(),
    );
  }

  @override
  bool checkAnswer() {
    final currentQuestion = model.lastQuestions[model.currentQuestionIndex];

    final sorted = currentQuestion.userAnswers.toList();
    sorted.sort((a, b) => a.compareTo(b));

    final solutionString = sorted.join();

    final answerCorrect = solutionString == currentQuestion.solution;

    model = model.copyWith(
      lastQuestions: model.lastQuestions.asMap().entries.map((entry) {
        if (entry.key == model.currentQuestionIndex) {
          return entry.value.copyWith(
            answerCorrect: answerCorrect,
          );
        }
        return entry.value;
      }).toList(),
    );
    return answerCorrect;
  }

  @override
  String getCurrentFishPic() {
    final currentQuestion = model.lastQuestions[model.currentQuestionIndex];
    var fishPic = currentQuestion.fishpic;

    fishPic = 'assets/fish/3_$fishPic';
    print(fishPic);

    return fishPic;
  }
}
