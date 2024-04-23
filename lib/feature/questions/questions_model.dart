import 'package:freezed_annotation/freezed_annotation.dart';

part 'questions_model.freezed.dart';
part 'questions_model.g.dart';

List<QuestionModel> mapToList(Map<String, dynamic> json) {
  final questions = <QuestionModel>[];

  for (final element in json.entries) {
    final questionsPerCategory = element.value as Map<String, dynamic>;

    for (final element in questionsPerCategory.entries) {
      questions.add(
        QuestionModel.fromJson(element.value as Map<String, dynamic>),
      );
    }
  }

  return questions;
}

Map<String, dynamic> listToMap(List<QuestionModel> questions) {
  return {
    for (final question in questions) question.id.toString(): question.toJson(),
  };
}

int stringToInt(String value) => int.parse(value);

String intToString(int value) => value.toString();

bool intToBool(int? value) {
  if (value == null) return false;
  return value == 1;
}

int boolToInt(bool value) {
  return value ? 1 : 0;
}

@freezed
class QuestionsModel with _$QuestionsModel {
  const factory QuestionsModel({
    @JsonKey(fromJson: mapToList, toJson: listToMap)
    required List<QuestionModel> questions,

    // @JsonKey(includeFromJson: false, defaultValue: -1)
    @Default(-1) int tappedCategoryIndex,
  }) = _QuestionsModel;

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);
}

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    @JsonKey(fromJson: stringToInt, toJson: intToString) required int id,
    required String question,
    required String answer1,
    required String answer2,
    required String answer3,
    required String solution,
    required String fishpic,
    required int categoryid,
    @JsonKey(fromJson: intToBool, toJson: boolToInt) @Default(true) bool active,
    @JsonKey(fromJson: intToBool, toJson: boolToInt)
    @Default(false)
    bool marked,
    @Default({}) Set<int> userAnswers,
    bool? answerCorrect,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

extension QuestionExt on QuestionModel {
  int get amountSolution => solution.length;
}
