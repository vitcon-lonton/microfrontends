import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/api.dart';
import 'banner_api.dart';
part 'banners_find_cubit.freezed.dart';

@freezed
class BannersFindState with _$BannersFindState {
  const factory BannersFindState.initial() = _Initial;
  const factory BannersFindState.notFound() = _NotFound;
  const factory BannersFindState.inProgress() = _InProgress;
  const factory BannersFindState.founded(KtList<String> urls) = _Founded;
}

class BannersFindCubit extends Cubit<BannersFindState> {
  BannersFindCubit(this._logger, this._bannerApi)
      : super(const BannersFindState.initial());

  final Logger _logger;
  final BannerApi _bannerApi;

  Future<void> findRequested() async {
    emit(const BannersFindState.inProgress());
    Option<KtList<String>> possibleBanners = await _performGetBanners();
    emit(possibleBanners.fold(() {
      return const BannersFindState.notFound();
    }, (urls) => BannersFindState.founded(urls)));
  }

  Future<Option<KtList<String>>> _performGetBanners() async {
    try {
      KtList<String> urls;
      BaseResponse<List<BannerDto>> response;
      List<BannerDto> responseData;

      urls = emptyList();
      response = await _bannerApi.banners();
      responseData = response.data!;

      for (var banner in responseData) {
        String bannerValueStr = banner.value;
        Map<String, dynamic> bannerValueJson = jsonDecode(bannerValueStr);
        bannerValueJson.forEach((key, value) {
          urls = urls.plusElement(value['img']);
        });
      }

      return optionOf(urls);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
