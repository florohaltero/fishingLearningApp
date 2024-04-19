import 'package:angelschein_lernen/feature/questions/questions_controller.dart';
import 'package:angelschein_lernen/feature/questions/questions_model.dart';
import 'package:flutter/material.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

class QuestionsView extends MViewC<QuestionsController, QuestionsModel> {
  const QuestionsView({
    required super.controller,
    super.key,
  });



  @override
  Widget build(BuildContext context, QuestionsModel model) {
    final questionsPerCategory =  model.questions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fragen'),
      ),
      body: questionsPerCategory.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        padding: const EdgeInsets.all(10),
        separatorBuilder: (context, index) =>
        const SizedBox(height: 10),
        itemCount: questionsPerCategory.length,
        itemBuilder: (context, index) {
          final item = questionsPerCategory[index];
          return ListTile(
            title: Text(item.id.toString()),
            subtitle: Text(item.question),
            hoverColor: Colors.amber,
            selectedTileColor: Colors.red,
            contentPadding: const EdgeInsets.all(10),
            tileColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }
}
