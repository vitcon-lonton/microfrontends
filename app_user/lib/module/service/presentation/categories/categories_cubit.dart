import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import '../../domain/entities.dart';
import '../../domain/i_service_repository.dart';
part 'categories_cubit.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const CategoriesState._();
  factory CategoriesState.init() => CategoriesState(cataloguesOption: none());
  factory CategoriesState(
      {@Default(false) bool isLoading,
      required Option<KtList<Catalogue>> cataloguesOption}) = _CategoriesState;

  KtList<Catalogue> get catalogues => cataloguesOption.getOrElse(emptyList);
}

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._repository) : super(CategoriesState.init());

  final IServiceRepository _repository;

  Future<void> getAllRequested() async {
    emit(state.copyWith(isLoading: true));
    Option<KtList<Catalogue>> possibleData = await _repository.allCatalogue();
    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(cataloguesOption: possibleData));
  }
}
