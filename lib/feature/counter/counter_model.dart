

class CounterModel {
  int count;
  CounterModel({required this.count});

  CounterModel copyWith({required int count}) => CounterModel(count: count);
}
