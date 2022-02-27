import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';

part 'categories_cubit.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const CategoriesState._();

  factory CategoriesState({
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(<Catalogue>[]) List<Catalogue> catalogues,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<ServiceFailure, List<Catalogue>>>
        getCategoriesFailureOrSuccessOption,
  }) = _CategoriesState;

  factory CategoriesState.init() {
    return CategoriesState(getCategoriesFailureOrSuccessOption: none());
  }

  CategoriesState busy() => copyWith(status: STATUS_BUSY);
  CategoriesState idle() => copyWith(status: STATUS_IDLE);
  CategoriesState failed() => copyWith(status: STATUS_FAILED);
  CategoriesState complete() {
    return copyWith(status: STATUS_COMPLETE);
  }
}

class CategoriesCubit extends Cubit<CategoriesState> {
  final IServiceRepository _repository;

  CategoriesCubit(this._repository) : super(CategoriesState.init());

  getAllCatalogues() async {
    emit(state.busy().copyWith(getCategoriesFailureOrSuccessOption: none()));

    final failureOrSuccess = await _repository.getCatalogues();

    emit(failureOrSuccess.fold((failure) {
      return state.failed();
    }, (catalogues) => state.idle().copyWith(catalogues: catalogues)));
  }
}
