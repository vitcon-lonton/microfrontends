/* spell-checker: disable */
part of 'booking_api.dart';

@freezed
class GetServiceIdsResponse with _$GetServiceIdsResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetServiceIdsResponse(List<int> serviceIds) =
      _GetServiceIdsResponse;

  factory GetServiceIdsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceIdsResponseFromJson(json);
}
