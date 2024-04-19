import 'package:flutter/cupertino.dart';
import 'package:formigas_mvc/formigas_mvc.dart';
import 'package:go_router/go_router.dart';

import 'category_model.dart';

abstract class CategoryController extends MVController<List<CategoryModel>> {
  CategoryController(this.suffix) : super(categories);

  final String suffix;

  void selectCategory(BuildContext context, int index);

}

class CategoryControllerImplementation extends CategoryController {
  CategoryControllerImplementation(super.suffix);


  @override
  void selectCategory(BuildContext context, int index) {
    context.go('$suffix/$index');
  }
}



