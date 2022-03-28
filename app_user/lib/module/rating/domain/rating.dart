/* spell-checker: disable */
import 'package:freezed_annotation/freezed_annotation.dart';
part 'rating.freezed.dart';
part 'rating.g.dart';

@freezed
class Rating with _$Rating {
  const Rating._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Rating({
    required int id,
    required int userId,
    required int technicianId,
    String? email,
    String? title,
    dynamic rate,
    String? content,
    int? approve,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? ratingScore,
    @JsonKey(name: 'realname') String? realName,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
