import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/booking/booking.dart';

@module
abstract class BookingInjectableModule {
  @Injectable()
  OrderDetailCubit get detail;

  @Injectable()
  OrderCreateCubit get create;

  @Injectable()
  OrderDeleteCubit get delete;

  @Injectable()
  OrderConfirmCubit get confirm;

  @Injectable()
  BookingHistoriesCubit get histories;

  @LazySingleton(as: IBookingRepository)
  BookingRepository get repository;

  @LazySingleton()
  BookingApi api(Dio dio) => BookingApi(dio);
}
