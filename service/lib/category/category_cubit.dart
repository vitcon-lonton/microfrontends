import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';

part 'category_cubit.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const CategoryState._();

  factory CategoryState({
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    @Default(<Catalogue>[]) List<Catalogue> catalogues,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
    required Option<Either<ServiceFailure, List<Catalogue>>>
        getCategoriesFailureOrSuccessOption,
  }) = _CategoryState;

  factory CategoryState.init() {
    return CategoryState(getCategoriesFailureOrSuccessOption: none());
  }

  CategoryState busy() => copyWith(status: const ProcessingStatus.busy());
  CategoryState idle() => copyWith(status: const ProcessingStatus.idle());
  CategoryState failed() => copyWith(status: const ProcessingStatus.failed());
  CategoryState complete() {
    return copyWith(status: const ProcessingStatus.complete());
  }
}

class CategoryCubit extends Cubit<CategoryState> {
  final IServiceRepository _serviceRepository;

  CategoryCubit(this._serviceRepository) : super(CategoryState.init());

  getAllCatalogues() async {
    emit(state.busy().copyWith(getCategoriesFailureOrSuccessOption: none()));

    final failureOrSuccess = await _serviceRepository.getCatalogues();

    emit(failureOrSuccess.fold((failure) {
      return state.failed();
    }, (catalogues) => state.idle().copyWith(catalogues: catalogues)));
  }
}
