import 'package:flutter/material.dart';
import 'package:formigas_mvc/formigas_mvc.dart';
import 'questions_controller.dart';
import 'questions_model.dart';

class QuestionsView extends MViewC<QuestionsController, List<QuestionsModel>> {
  QuestionsView({
    required super.controller,
    super.key,
  }) {
    controller.loadQuestions('c01');
  }

  @override
  Widget build(BuildContext context, List<QuestionsModel> model) => Scaffold(
      appBar: AppBar(
        title: const Text("Fragen"),
      ),
      body: model.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (context, index) => SizedBox(height: 10,),

        itemCount: model.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(model[index].id.toString()),
            subtitle: Text(model[index].question),
            hoverColor: Colors.amber,
            selectedTileColor: Colors.red,
            // onTap: () => setState(() {
            //   _selectedIndex = index;
            //
            // }),
            // selected: _selectedIndex == index,
            contentPadding: EdgeInsets.all(10),
            tileColor: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
          );
        },
      ));

}