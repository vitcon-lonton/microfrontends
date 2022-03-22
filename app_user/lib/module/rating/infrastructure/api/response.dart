/* spell-checker: disable */
part of 'rating_api.dart';

@freezed
class RatingDto with _$RatingDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RatingDto(
      {required int id,
      required int userId,
      required String fullname}) = _RatingDto;

  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);
}
