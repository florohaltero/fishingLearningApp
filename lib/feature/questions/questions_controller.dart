import 'dart:convert';

import 'package:angelschein_lernen/feature/questions/questions_model.dart';
import 'package:flutter/services.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

abstract class QuestionsController extends MVController<QuestionsModel> {
  QuestionsController(super.initialModel);

  Future<void> loadQuestions(String category);
}

class QuestionsControllerImplementation extends QuestionsController {
  QuestionsControllerImplementation()
      : super(const QuestionsModel(questions: [])) {
    loadQuestions('c01');
  }

  @override
  Future<void> loadQuestions(String category) async {
    final list = await _loadJson();
    final questions = QuestionsModel.fromJson(list).questions;

    model = model.copyWith(questions: questions);
  }

  Future<Map<String, dynamic>> _loadJson() async {
    final asset = await rootBundle.loadString('assets/bw_data.json');
    final data = json.decode(asset) as Map<String, dynamic>;
    return data;
  }
}
