import 'package:flutter/material.dart';
import 'package:formigas_mvc/formigas_mvc.dart';
import 'exams_controller.dart';
import 'exams_model.dart';

class ExamsView extends MViewC<ExamsController, ExamsModel> {
  const ExamsView({
    required super.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context, ExamsModel model) => const Scaffold(
        body: Center(child: Text('ExamsView')),
      );  

}