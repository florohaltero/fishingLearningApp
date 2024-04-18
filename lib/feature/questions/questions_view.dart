import 'package:flutter/material.dart';
import 'package:formigas_mvc/formigas_mvc.dart';
import 'questions_controller.dart';
import 'questions_model.dart';

class QuestionsView extends MViewC<QuestionsController, QuestionsModel> {
  const QuestionsView({
    required super.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context, QuestionsModel model) => const Scaffold(
        body: Center(child: Text('QuestionsView')),
      );  

}