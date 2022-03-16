import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/entities.dart';
import '../domain/failure.dart';
import '../domain/i_service_repository.dart';
import 'models.dart';
import 'service_api.dart';

class ServiceRepository implements IServiceRepository {
  final Logger _logger;
  final ServiceApi _serviceApi;
  final CatalogueApi _catalogueApi;

  ServiceRepository(this._logger, this._serviceApi, this._catalogueApi);

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
      final response = await _serviceApi.getDetail(id);
      if (!response.valid) return none();
      return optionOf(response.data!);
      // return optionOf(Service.random());
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Option<List<Catalogue>>> getCatalogues() async {
    try {
      final response = await _catalogueApi.getCatalogues();
      if (!response.valid) return none();
      final catalogues = response.data!.map((catalogue) {
        return catalogue.toDomain();
      }).toList();

      return optionOf(catalogues..addAll(_fakeCategories));
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Option<Pagination<Service>>> getServices(
      {required int page, required int perPage}) async {
    try {
      final response = await _serviceApi.getServices();
      if (!response.valid) return none();
      final services = response.data!;
      final result = Pagination<Service>(
          pageCount: 1,
          totalCount: 1,
          page: page,
          perPage: perPage,
          data: [...services, ...services]);

      return optionOf(result);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}

const _fakeCategories = [
  Catalogue(id: 1, name: 'Pet care'),
  Catalogue(id: 2, name: 'Babysitting'),
  Catalogue(id: 4, name: 'Furnishing'),
  Catalogue(id: 5, name: 'Washing'),
  Catalogue(id: 6, name: 'Cleaning'),
];
