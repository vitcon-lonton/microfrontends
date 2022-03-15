import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/booking_entities.dart';
import '../../domain/i_booking_repository.dart';
part 'booking_histories_cubit.freezed.dart';

@freezed
class BookingHistoriesState with _$BookingHistoriesState {
  const BookingHistoriesState._();
  factory BookingHistoriesState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(false) bool isSubmitting,
    required Option<List<Booking>> bookingsOption,
  }) = _BookingHistoriesState;

  bool get isLastPage => page == pageCount;

  List<Booking> get bookings {
    return List.of(
      bookingsOption.foldRight(<Booking>[], (bookings, prev) => bookings),
    );
  }

  factory BookingHistoriesState.init() {
    return BookingHistoriesState(bookingsOption: none());
  }
}

class BookingHistoriesCubit extends Cubit<BookingHistoriesState> {
  final IBookingRepository _repository;

  BookingHistoriesCubit(this._repository) : super(BookingHistoriesState.init());

  Future<Option<Pagination<Booking>>> _performGetOrders() {
    return _repository.histories(page: state.page, perPage: state.perPage);
  }

  Future<void> getOrdersRequested() async {
    emit(state.copyWith(isSubmitting: true));

    final result = await _performGetOrders();

    result.fold(() {}, (pagination) {
      final currentOrders = state.bookings;
      final newOrders = currentOrders..addAll(pagination.data);

      emit(state.copyWith(
          page: pagination.page,
          perPage: pagination.perPage,
          pageCount: pagination.pageCount,
          totalCount: pagination.totalCount,
          bookingsOption: optionOf(newOrders)));
    });

    emit(state.copyWith(isSubmitting: false));
  }

  void refreshRequested() => emit(BookingHistoriesState.init());

  void pageNumberChanged(int value) => emit(state.copyWith(page: value));
}
