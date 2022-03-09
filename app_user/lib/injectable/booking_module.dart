import 'package:injectable/injectable.dart';

import '../module/booking/booking.dart';

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
