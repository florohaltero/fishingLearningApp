import 'package:angelschein_lernen/feature/exams/exams_model.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

abstract class ExamsController extends MVController<ExamsModel> {
  ExamsController(super.initialModel);
  void dummy();
}

class ExamsControllerImplementation extends ExamsController {
  ExamsControllerImplementation() : super(const ExamsModel(count: 0));

  @override
  void dummy() {
    // Update the model
    model = ExamsModel(count: model.count - 1);
  }
}
