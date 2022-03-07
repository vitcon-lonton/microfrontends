import 'package:booking/booking.dart';

import 'package:injectable/injectable.dart';

@module
abstract class BookingModule {
  @Injectable()
  CartCubit get cartCubit;

  @Injectable()
  OrderDetailCubit get orderDetailCubit;

  @Injectable()
  OrderRatingCubit get orderRatingCubit;

  @Injectable()
  OrderHistoriesCubit get orderHistoriesCubit;

  @LazySingleton(as: IBookingRepository)
  BookingRepository get bookingRepository;
}
