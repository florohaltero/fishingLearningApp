import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatelessWidget {
  const MainView({
    required this.navigationShell, super.key,
  });

  final StatefulNavigationShell navigationShell;



  @override
  Widget build(BuildContext context) => Scaffold(
    body: navigationShell,
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      onTap: navigationShell.goBranch,
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



