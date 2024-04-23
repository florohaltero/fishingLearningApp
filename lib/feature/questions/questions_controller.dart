import 'dart:convert';

import 'package:angelschein_lernen/feature/questions/questions_model.dart';
import 'package:flutter/services.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

abstract class QuestionsController extends MVController<QuestionsModel> {
  QuestionsController(super.initialModel);

  Future<void> loadQuestions(int categoryIndex);
}

class QuestionsControllerImplementation extends QuestionsController {
  QuestionsControllerImplementation(int categoryId)
      : super(QuestionsModel(questions: [], tappedCategoryIndex: categoryId)) {
    loadQuestions(categoryId);
  }

  @override
  Future<void> loadQuestions(int categoryIndex) async {
    final list = await _loadJson();
    final questions = QuestionsModel.fromJson(list).questions;
    final questionsPerCategory = questions
        .where(
          (element) => element.categoryid == categoryIndex,
        )
        .toList();

    model = model.copyWith(questions: questionsPerCategory);
  }

  Future<Map<String, dynamic>> _loadJson() async {
    final asset = await rootBundle.loadString('assets/bw_data.json');
    final data = json.decode(asset) as Map<String, dynamic>;
    return data;
  }
}
