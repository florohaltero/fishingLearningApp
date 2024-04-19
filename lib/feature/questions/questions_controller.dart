import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:formigas_mvc/formigas_mvc.dart';
import 'questions_model.dart';

abstract class QuestionsController extends MVController<List<QuestionsModel>> {
  QuestionsController(super.initialModel);

  Future<bool> loadQuestions(String category);
}

class QuestionsControllerImplementation extends QuestionsController {
  QuestionsControllerImplementation() : super([]);

  @override
  Future<bool> loadQuestions(String category) async {
    final list = await _loadJson();
    final qList = <QuestionsModel>[];
    final questions = list['questions'][category] as Map<String, dynamic>;

    questions.forEach((key, value) {
      var q = QuestionsModel.fromJson(value as Map<String, dynamic>);
      qList.add(q);
    });

    // for (dynamic item in questions){
    //   Map<String, dynamic> questions = AssetManager().questions;
    //   Question q = Question.fromJson(item);
    //   qList.add(q);
    // }
    model = qList;
    return Future.value(true);
  }

  Future<Map<String, dynamic>> _loadJson() async {
    final asset = await rootBundle.loadString('assets/bw_data.json');
    final data = json.decode(asset) as Map<String, dynamic>;
    return data;
  }
}
