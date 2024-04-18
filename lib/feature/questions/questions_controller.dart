import 'package:formigas_mvc/formigas_mvc.dart';
import 'questions_model.dart';

abstract class QuestionsController extends MVController<QuestionsModel> {
  QuestionsController(super.initialModel);  
  void dummy();
}
  
class QuestionsControllerImplementation extends QuestionsController {
  QuestionsControllerImplementation() : super(const QuestionsModel(count: 0));
  
  @override
  void dummy() {
    // Update the model
    model = QuestionsModel(count: model.count - 1);
  }
}