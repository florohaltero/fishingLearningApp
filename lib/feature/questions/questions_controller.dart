import 'package:formigas_mvc/formigas_mvc.dart';
import 'questions_model.dart';

abstract class QuestionsController extends MVController<QuestionsModel> {
  QuestionsController(super.initialModel);  
  void dummy();
}
  
class QuestionsControllerImplementation extends QuestionsController {
  QuestionsControllerImplementation() : super(const QuestionsModel());
  
  @override
  void dummy() {
    // Update the model
    model = const QuestionsModel();
  }
}