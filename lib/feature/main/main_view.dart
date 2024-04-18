import 'package:angelschein_lernen/app/app.dart';
import 'package:angelschein_lernen/feature/category/category_controller.dart';
import 'package:angelschein_lernen/feature/category/category_view.dart';
import 'package:angelschein_lernen/feature/questions/questions_controller.dart';
import 'package:angelschein_lernen/feature/questions/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:formigas_mvc/formigas_mvc.dart';
import 'package:go_router/go_router.dart';
import 'main_controller.dart';
import 'main_model.dart';

class MainView extends MViewC<MainController, MainModel> {
  const MainView({
    required super.controller,
    super.key,
  });



  @override
  Widget build(BuildContext context, MainModel model) => Scaffold(
    body: IndexedStack(
      index: model.index,
      children: <Widget>[
        CategoryView(controller: CategoryControllerImplementation()),
        QuestionsView(controller: QuestionsControllerImplementation()),
        CategoryView(controller: CategoryControllerImplementation()),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: model.index,
      onTap: controller.changeIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.category),
          icon: Icon(Icons.category_outlined),
          label: 'Questions',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.question_answer),
          icon: Icon(Icons.question_answer_outlined),
          label: 'Practice',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.book_online),
          icon: Icon(Icons.book_online_outlined),
          label: 'Exams',
        ),

      ],
    ),
  );

}



