import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
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
  Future<Option<KtList<Catalogue>>> allCatalogue() async {
    try {
      final response = await _catalogueApi.getCatalogues();
      final catalogues = KtList.from(response.data!.map((catalogue) {
        return catalogue.toDomain();
      })).plus(_fakeCategories);

      return optionOf(catalogues.plus(catalogues));
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Option<Pagination<Service>>> allService(
      {required int page, required int perPage}) async {
    try {
      final response = await _serviceApi.getServices();
      final services = KtList.from(response.data!);
      return optionOf(Pagination<Service>(
          page: page,
          pageCount: 1,
          totalCount: 1,
          perPage: perPage,
          data: services.plus(services)));
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}

final _fakeCategories = KtList.of(
    const Catalogue(id: 1, name: 'Pet care'),
    const Catalogue(id: 2, name: 'Babysitting'),
    const Catalogue(id: 4, name: 'Furnishing'),
    const Catalogue(id: 5, name: 'Washing'),
    const Catalogue(id: 6, name: 'Cleaning'));
