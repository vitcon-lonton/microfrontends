import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:app_user/core/core.dart';
import '../../domain/entities.dart';
import '../../domain/i_service_repository.dart';
part 'services_cubit.freezed.dart';

@freezed
class ServicesState with _$ServicesState {
  const ServicesState._();
  factory ServicesState.init() => ServicesState(servicesOption: none());
  factory ServicesState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(STATUS_IDLE) status,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<KtList<Service>> servicesOption,
  }) = _ServicesState;

  KtList<Service> get services => servicesOption.getOrElse(emptyList);

  bool get isLastPage => page == pageCount;
}

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(this._repository) : super(ServicesState.init());

  final IServiceRepository _repository;

  Future<void> getServicesRequested() async {
    emit(state.copyWith(isSubmitting: true));

    Option<Pagination<Service>> possibleData;
    possibleData = await _performGetServices();
    possibleData.fold(() {}, (pagination) {
      emit(state.copyWith(
          page: pagination.page,
          perPage: pagination.perPage,
          pageCount: pagination.pageCount,
          totalCount: pagination.totalCount,
          servicesOption: optionOf(state.services.plus(pagination.data))));
    });

    emit(state.copyWith(isSubmitting: false));
  }

  void refreshRequested() => emit(ServicesState.init());

  void pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<Option<Pagination<Service>>> _performGetServices() {
    return _repository.all(page: state.page, perPage: state.perPage);
  }
}
