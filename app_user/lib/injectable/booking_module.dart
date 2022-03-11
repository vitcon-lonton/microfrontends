import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../module/booking/booking.dart';

@module
abstract class BookingModule {
  @Injectable()
  OrderDetailCubit get detail;

  @Injectable()
  OrderCreateCubit get create;

  @Injectable()
  OrderRatingCubit get rating;

  @Injectable()
  OrderHistoriesCubit get histories;

  @LazySingleton(as: IBookingRepository)
  BookingRepository get repository;

  @LazySingleton()
  BookingApi api(Dio dio) => BookingApi(dio);
}
