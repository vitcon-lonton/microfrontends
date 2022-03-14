import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../module/booking/booking.dart';

@module
abstract class BookingInjectableModule {
  @Injectable()
  OrderDetailCubit get detail;

  @Injectable()
  OrderCreateCubit get create;

  @Injectable()
  OrderDeleteCubit get delete;

  @Injectable()
  OrderRatingCubit get rating;

  @Injectable()
  OrderConfirmCubit get confirm;

  @Injectable()
  OrderHistoriesCubit get histories;

  @LazySingleton(as: IBookingRepository)
  BookingRepository get repository;

  @LazySingleton()
  BookingApi api(Dio dio) => BookingApi(dio);
}
