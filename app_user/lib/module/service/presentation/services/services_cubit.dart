import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/entities.dart';
import '../../domain/i_repository.dart';
part 'services_cubit.freezed.dart';

@freezed
class ServicesState with _$ServicesState {
  const ServicesState._();

  factory ServicesState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(STATUS_IDLE) status,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<List<Service>> servicesOption,
  }) = _ServicesState;

  bool get isLastPage => page == pageCount;

  List<Service> get services => List.of(
      servicesOption.foldRight(<Service>[], (services, prev) => services));

  factory ServicesState.init() => ServicesState(servicesOption: none());

  ServicesState busy() => copyWith(status: STATUS_BUSY);
  ServicesState idle() => copyWith(status: STATUS_IDLE);
  ServicesState failed() => copyWith(status: STATUS_FAILED);
  ServicesState complete() => copyWith(status: STATUS_COMPLETE);
}

class ServicesCubit extends Cubit<ServicesState> {
  final IServiceRepository _repository;

  ServicesCubit(this._repository) : super(ServicesState.init());

  refreshRequested() => emit(ServicesState.init());

  pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<void> getServicesRequested() async {
    emit(state.copyWith(isSubmitting: true));

    final page = state.page;
    final perPage = state.perPage;
    final resultOption =
        await _repository.getServices(page: page, perPage: perPage);

    resultOption.fold(() {}, (pagination) {
      final newServices = state.services;
      newServices.addAll(pagination.data);

      emit(state.copyWith(
          page: pagination.page,
          perPage: pagination.perPage,
          pageCount: pagination.pageCount,
          totalCount: pagination.totalCount,
          servicesOption: optionOf(newServices)));
    });

    emit(state.copyWith(isSubmitting: false));
  }
}
