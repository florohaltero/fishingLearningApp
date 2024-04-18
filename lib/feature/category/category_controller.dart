import 'package:angelschein_lernen/feature/counter/counter_model.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

import 'category_model.dart';

abstract class CategoryController extends MVController<List<CategoryModel>> {
  CategoryController(super.initialModel);

  final TargetType target = TargetType.list;

  void loadCategories();

}

class CategoryControllerImplementation extends CategoryController {
  CategoryControllerImplementation() : super([]);

  final List<CategoryModel> _categoryList = [
    CategoryModel(0, "Allgemeine Fischkunde",  "Fragen über allgemeine Fischkunde: Fischarten ,Fischanatomie, Fortpflanzung"),
    CategoryModel(1, "Spezielle Fischkunde", "Spezielle Fischkunde"),
    CategoryModel(2, "Gewässerökologie und Fischhege", "description"),
    CategoryModel(3, "Gerätekunde, Fangtechnik", "description"),
    CategoryModel(4, "Rechtskunde", "Rechtskunde")
  ];


  @override
  void loadCategories() {
    super.model = _categoryList;
  }


}
