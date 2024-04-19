import 'package:angelschein_lernen/feature/exams/exams_controller.dart';
import 'package:angelschein_lernen/feature/exams/exams_model.dart';
import 'package:flutter/material.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

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
