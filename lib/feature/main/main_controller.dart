import 'package:formigas_mvc/formigas_mvc.dart';
import 'main_model.dart';

abstract class MainController extends MVController<MainModel> {
  MainController(super.initialModel);  
  void changeIndex(int index);
}
  
class MainControllerImplementation extends MainController {
  MainControllerImplementation() : super(const MainModel(index: 0));


  @override
  void changeIndex(int index) {
    model = MainModel(index: index);
  }
}