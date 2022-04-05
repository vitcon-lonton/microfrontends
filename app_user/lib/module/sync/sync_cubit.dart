/* spell-checker: disable */
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:app_user/module/auth/auth.dart';
import 'package:app_user/module/booking/booking.dart';
import 'package:app_user/module/cart/cart.dart';
part 'sync_cubit.freezed.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState.initial() = _Initial;
  const factory SyncState.inProgress() = _InProgress;
  const factory SyncState.syncSuccess() = _SyncSuccess;
  const factory SyncState.syncFailure(BookingFailure failure) = _SyncFailure;
}

class SyncCubit extends Cubit<SyncState> {
  SyncCubit(this._cartRepository, this._bookingRepository)
      : super(const SyncState.initial());

  final ICartRepository _cartRepository;
  final IBookingRepository _bookingRepository;

  Future<void> started() async {
    Option<KtList<CartItem>> possibleItems = _cartRepository.all();
    KtList<CartItem>? items = possibleItems.toNullable();
    bool itemsIsNotEmpty = !(items?.isEmpty() ?? true);

    if (itemsIsNotEmpty) {
      emit(const SyncState.inProgress());

      Either<BookingFailure, Unit> failureOrSuccess;

      KtList<BookingItem> bookingItems = items!.map((item) {
        return BookingItem(
            serviceId: item.serviceId,
            endTime: item.timeEnd(),
            startTime: item.timeStart(),
            description: item.note?.getOrCrash());
      }).toList();

      failureOrSuccess = await performCreate(bookingItems);

      emit(failureOrSuccess.fold((failure) {
        return SyncState.syncFailure(failure);
      }, (_) => const SyncState.syncSuccess()));
    }
  }

  Future<Either<BookingFailure, Unit>> performCreate(
      KtList<BookingItem> bookingItems) {
    return _bookingRepository.create(
        items: bookingItems,
        fullName: Name('My Name'),
        phoneNumber: Phone('0372560987'),
        address: 'My Address');
  }
}
