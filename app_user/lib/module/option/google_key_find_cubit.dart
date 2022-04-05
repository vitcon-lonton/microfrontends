import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/api.dart';
import 'base_api.dart';
part 'google_key_find_cubit.freezed.dart';

@freezed
class GoogleKeyFindState with _$GoogleKeyFindState {
  const factory GoogleKeyFindState.initial() = _Initial;
  const factory GoogleKeyFindState.notFound() = _NotFound;
  const factory GoogleKeyFindState.inProgress() = _InProgress;
  const factory GoogleKeyFindState.founded(String key) = _Founded;
}

class GoogleKeyFindCubit extends Cubit<GoogleKeyFindState> {
  GoogleKeyFindCubit(this._logger, this._baseApi)
      : super(const GoogleKeyFindState.initial());

  final Logger _logger;
  final BaseApi _baseApi;

  Future<void> findRequested() async {
    emit(const GoogleKeyFindState.inProgress());
    Option<String> possibleBanners = await _performGetKey();
    emit(possibleBanners.fold(() {
      return const GoogleKeyFindState.notFound();
    }, (key) => GoogleKeyFindState.founded(key)));
  }

  Future<Option<String>> _performGetKey() async {
    try {
      List<OptionDto> responseData;
      BaseResponse<List<OptionDto>> response;

      response = await _baseApi.googleMapKey();
      responseData = response.data!;

      return optionOf(responseData.first.value);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
