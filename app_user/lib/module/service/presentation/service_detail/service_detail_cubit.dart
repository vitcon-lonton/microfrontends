import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/i_service_repository.dart';
import '../../domain/service.dart';
part 'service_detail_cubit.freezed.dart';

@freezed
class ServiceDetailState with _$ServiceDetailState {
  const ServiceDetailState._();

  factory ServiceDetailState.init() => ServiceDetailState(detailOption: none());

  factory ServiceDetailState(
      {@Default(false) bool isSubmitting,
      required Option<Service> detailOption}) = _ServiceDetailState;

  Service? get service {
    return detailOption.foldRight(null, (detail, previous) => detail);
  }
}

class ServiceDetailCubit extends Cubit<ServiceDetailState> {
  final IServiceRepository _repository;

  ServiceDetailCubit(this._repository) : super(ServiceDetailState.init());

  Future<void> getDetailRequested(int id) async {
    emit(state.copyWith(isSubmitting: true));

    final detailOption = await _repository.detail(id);

    emit(state.copyWith(detailOption: detailOption));
    emit(state.copyWith(isSubmitting: false));
  }
}


// Future<void> unlikeRequested() async {
//   emit(state.copyWith(isSubmittingLike: true));

//   if (!state.isLiked) {
//     emit(state.copyWith(isSubmittingLike: false));
//     return;
//   }

//   await _repository.getServiceDetail();
//   emit(state.copyWith(isLiked: false));
//   emit(state.copyWith(isSubmittingLike: false));
//   return;
// }

// Future<void> likeRequested() async {
//   emit(state.copyWith(isSubmittingLike: true));

//   if (state.isLiked) {
//     emit(state.copyWith(isSubmittingLike: false));
//     return;
//   }

//   await _repository.getServiceDetail();
//   emit(state.copyWith(isLiked: true));
//   emit(state.copyWith(isSubmittingLike: false));
//   return;
// }