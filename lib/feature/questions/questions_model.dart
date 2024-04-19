import 'package:json_annotation/json_annotation.dart';
part 'questions_model.g.dart';

@JsonSerializable()

class QuestionsModel extends Object {


  QuestionsModel(this.id, this.question, this.answer1, this.answer2, this.answer3,
      this.solution, this.fishpic, this.categoryid);

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);
  @JsonKey(fromJson: _stringToInt, toJson: _stringFromInt)
  final int id;
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;
  final String solution;
  final String fishpic;
  final int categoryid;
  @JsonKey(includeFromJson: false, includeToJson: true)
  bool active = true;
  @JsonKey(includeFromJson: false, includeToJson: true)
  bool marked = false;
  @JsonKey(includeFromJson: false, includeToJson: true)
  Set<int> userAnswers = {};
  @JsonKey(includeFromJson: false, includeToJson: true)
  bool? answerCorrect = null;

  int get amountSolution {
    return solution.length;
  }

  Map<String, dynamic> toJson() => _$QuestionsModelToJson(this);

  static int _stringToInt(String number) => int.parse(number);
  static String _stringFromInt(int number) => number.toString();
}
