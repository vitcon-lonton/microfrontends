import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/booking/booking.dart';

@module
abstract class BookingInjectableModule {
  @Injectable()
  BookingHistoriesCubit get histories;

  @Injectable()
  BookingServicesFindCubit get servicesFind;

  @Injectable()
  BookingDetailCubit get detail;

  @Injectable()
  BookingCreateCubit get create;

  @Injectable()
  BookingCancelCubit get cancel;

  @Injectable()
  BookingConfirmCubit get confirm;

  @LazySingleton(as: IBookingRepository)
  BookingRepository get repository;

  @LazySingleton()
  BookingApi api(Dio dio) => BookingApi(dio);

  @Injectable()
  BookingTechnicianFindCubit get technicianFind;
}
