import 'package:angelschein_lernen/feature/questions/questions_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_model.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PracticeModel with _$PracticeModel {
  factory PracticeModel({
    required int categoryIndex,
    // @Default(-1)
    // int questionId,
    @Default(-1) int currentQuestionIndex,
    @Default([]) List<QuestionModel> questions,
    /* TODO: I think it makes sense to save current question in the model
        because lastQuestion gets longer and longer and at one update the hole
        list is update */
    @Default([]) List<QuestionModel> lastQuestions,
  }) = _PracticeModel;
}
