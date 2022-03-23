import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/entities.dart';
import '../domain/failure.dart';
import '../domain/i_service_repository.dart';
import 'api/api.dart';

class ServiceRepository implements IServiceRepository {
  final Logger _logger;
  final ServiceApi _serviceApi;

  ServiceRepository(this._logger, this._serviceApi);

  @override
  Future<Either<ServiceFailure, Unit>> check(Service service) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      return left(const ServiceFailure.serverError());
      // return right(unit);
    } catch (_) {
      return left(const ServiceFailure.serverError());
    }
  }

  @override
  Future<Option<Service>> detail(int id) async {
    try {
      final response = await _serviceApi.detail(id);
      if (!response.valid) return none();
      return optionOf(response.data!);
      // return optionOf(Service.random());
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Option<Pagination<Service>>> all({int? page, int? perPage}) async {
    try {
      final response = await _serviceApi.all();
      final totalPages = response.data!.meta.totalPages;
      final currentPage = response.data!.meta.currentPage;
      final services = KtList.from(response.data!.services);

      return optionOf(Pagination<Service>(
          data: services,
          page: currentPage,
          pageCount: totalPages,
          totalCount: services.size,
          perPage: perPage ?? services.size));

      // return optionOf(Pagination<Service>(
      //     page: page,
      //     pageCount: 1,
      //     totalCount: 1,
      //     perPage: perPage,
      //     data: services.plus(services)));
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
