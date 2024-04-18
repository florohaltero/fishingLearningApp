import 'package:flutter/cupertino.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

import 'category_model.dart';

abstract class CategoryController extends MVController<List<CategoryModel>> {
  CategoryController() : super(categories);


  void selectCategory(BuildContext context, int index);

}

class CategoryQuestionsControllerImplementation extends CategoryController {
  CategoryQuestionsControllerImplementation() : super();


  @override
  void selectCategory(BuildContext context, int index) {

  }
}

class CategoryPracticeControllerImplementation extends CategoryController {
  CategoryPracticeControllerImplementation() : super();

  @override
  void selectCategory(BuildContext context, int index) {

  }

}


