import 'package:flutter/material.dart';
import 'package:formigas_mvc/formigas_mvc.dart';
import 'practice_controller.dart';
import 'practice_model.dart';

class PracticeView extends MViewC<PracticeController, PracticeModel> {
  const PracticeView({
    required super.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context, PracticeModel model) => const Scaffold(
        body: Center(child: Text('PracticeView')),
      );  

}