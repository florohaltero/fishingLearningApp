import 'package:angelschein_lernen/feature/counter/counter_model.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

abstract class CounterController extends MVController<CounterModel> {
  CounterController(super.initialModel);

  void increment();

  void decrement();
}

class CounterControllerImplementation extends CounterController {
  CounterControllerImplementation() : super(CounterModel(count: 0));

  @override
  void increment() => model = model.copyWith(count: model.count + 1);

  @override
  void decrement() => model = model.copyWith(count: model.count - 1);
}
