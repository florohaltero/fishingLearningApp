import 'package:angelschein_lernen/feature/practice/practice_model.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

abstract class PracticeController extends MVController<PracticeModel> {
  PracticeController(super.initialModel);
  void dummy();
}

class PracticeControllerImplementation extends PracticeController {
  PracticeControllerImplementation() : super(const PracticeModel(count: 0));

  @override
  void dummy() {
    // Update the model
    model = PracticeModel(count: model.count - 1);
  }
}
