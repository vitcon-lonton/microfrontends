import 'dart:io';
import 'package:app_user/core/api.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:logger/logger.dart';
import 'file_api.dart';
part 'upload_files_cubit.freezed.dart';

@freezed
class UploadFilesState with _$UploadFilesState {
  const factory UploadFilesState.initial() = _Initial;
  const factory UploadFilesState.inProgress() = _InProgress;
  const factory UploadFilesState.uploadFailure() = _UploadFailure;
  const factory UploadFilesState.uploadSuccess(KtList<String> urls) =
      _UploadSuccess;
}

class UploadFilesCubit extends Cubit<UploadFilesState> {
  UploadFilesCubit(this._logger, this._fileApi)
      : super(const UploadFilesState.initial());

  final Logger _logger;
  final FileApi _fileApi;

  Future<void> uploaded(List<File> files) async {
    emit(const UploadFilesState.inProgress());
    Option<KtList<String>> possibleFailure = await _performUpload(files);
    emit(possibleFailure.fold(() {
      return const UploadFilesState.uploadFailure();
    }, (urls) => UploadFilesState.uploadSuccess(urls)));
  }

  Future<Option<KtList<String>>> _performUpload(List<File> files) async {
    try {
      KtList<String> urls;
      BaseResponse<dynamic> response;
      Map<String, dynamic> responseData;

      urls = emptyList();
      response = await _fileApi.upload(files);
      responseData = Map<String, dynamic>.from(response.data!);
      responseData.forEach((String key, dynamic value) {
        urls.plusElement(Image.fromJson(Map<String, dynamic>.from(value)).img);
      });

      return optionOf(urls);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
