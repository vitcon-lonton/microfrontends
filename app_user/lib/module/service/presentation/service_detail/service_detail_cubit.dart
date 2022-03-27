import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/i_service_repository.dart';
import '../../domain/service.dart';
part 'service_detail_cubit.freezed.dart';

@freezed
class ServiceDetailState with _$ServiceDetailState {
  const ServiceDetailState._();
  const factory ServiceDetailState.initial() = _Initial;
  const factory ServiceDetailState.notFound() = _NotFound;
  const factory ServiceDetailState.inProgress() = _InProgress;
  const factory ServiceDetailState.founded(Service service) = _Founded;
}

class ServiceDetailCubit extends Cubit<ServiceDetailState> {
  ServiceDetailCubit(this._repository)
      : super(const ServiceDetailState.initial());

  final IServiceRepository _repository;

  Future<void> getDetailRequested(int id) async {
    emit(const ServiceDetailState.inProgress());
    Option<Service> possibleData = await _repository.detail(id);
    emit(possibleData.fold(() {
      return const ServiceDetailState.notFound();
    }, (service) => ServiceDetailState.founded(service)));
  }
}


// @freezed
// class ServiceDetailState with _$ServiceDetailState {
//   const ServiceDetailState._();
//   factory ServiceDetailState.init() => ServiceDetailState(detailOption: none());
//   factory ServiceDetailState(
//       {@Default(false) bool isLoading,
//       required Option<Service> detailOption}) = _ServiceDetailState;
//   Service? get service => detailOption.toNullable();
// }
// Future<void> getDetailRequested(int id) async {
// emit(state.copyWith(isLoading: true));
// final detailOption = await _repository.detail(id);
// emit(state.copyWith(detailOption: detailOption));
// emit(state.copyWith(isLoading: false));
// }