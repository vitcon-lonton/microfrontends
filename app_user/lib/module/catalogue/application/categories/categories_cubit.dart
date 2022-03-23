import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:logger/logger.dart';
import '../../api/api.dart';
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
  final Logger _logger;
  final CatalogueApi _catalogueApi;

  CategoriesCubit(
    this._logger,
    this._catalogueApi,
  ) : super(CategoriesState.init());

  Future<Option<KtList<Catalogue>>> _performGetAll() async {
    try {
      final response = await _catalogueApi.all();
      final catalogues = KtList.from(response.data!);

      // .plus(_fakeCategories);

      // return optionOf(catalogues.plus(catalogues));
      return optionOf(catalogues);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  Future<void> getAllRequested() async {
    emit(state.copyWith(isLoading: true));
    Option<KtList<Catalogue>> possibleData = await _performGetAll();
    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(cataloguesOption: possibleData));
  }
}
