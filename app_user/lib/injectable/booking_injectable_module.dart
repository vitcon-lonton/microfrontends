import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/booking/booking.dart';

@module
abstract class BookingInjectableModule {
  @Injectable()
  BookingDetailCubit get detail;

  @Injectable()
  BookingCreateCubit get create;

  @Injectable()
  BookingCancelCubit get cancel;

  @Injectable()
  BookingConfirmCubit get confirm;

  @Injectable()
  BookingHistoriesCubit get histories;

  @Injectable()
  TechnicianInfoCubit get technicianInfo;

  @LazySingleton(as: IBookingRepository)
  BookingRepository get repository;

  @LazySingleton()
  BookingApi api(Dio dio) => BookingApi(dio);
}
