class CounterModel {
  CounterModel({required this.count});
  int count;

  CounterModel copyWith({required int count}) => CounterModel(count: count);
}
