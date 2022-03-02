import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/i_repository.dart';

part 'categories_cubit.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const CategoriesState._();

  factory CategoriesState(
      {@Default(false) bool isSubmitting,
      @Default(true) bool showErrorMessages,
      @Default(STATUS_IDLE) ProcessingStatus status,
      required Option<List<Catalogue>> cataloguesOption}) = _CategoriesState;

  List<Catalogue> get catalogues =>
      cataloguesOption.getOrElse(() => <Catalogue>[]);

  factory CategoriesState.init() => CategoriesState(cataloguesOption: none());

  CategoriesState busy() => copyWith(status: STATUS_BUSY);
  CategoriesState idle() => copyWith(status: STATUS_IDLE);
  CategoriesState failed() => copyWith(status: STATUS_FAILED);
  CategoriesState complete() => copyWith(status: STATUS_COMPLETE);
}

class CategoriesCubit extends Cubit<CategoriesState> {
  final IServiceRepository _repository;

  CategoriesCubit(this._repository) : super(CategoriesState.init());

  Future<void> getCataloguesRequested() async {
    emit(state.copyWith(isSubmitting: true));

    final resultOption = await _repository.getCatalogues();

    final currentCatalogues = state.catalogues;
    final resultCatalogues = resultOption.getOrElse(() => <Catalogue>[]);
    final newCatalogues = currentCatalogues..addAll(resultCatalogues);

    emit(state.copyWith(isSubmitting: false));
    emit(state.copyWith(cataloguesOption: optionOf(newCatalogues)));
  }
}
