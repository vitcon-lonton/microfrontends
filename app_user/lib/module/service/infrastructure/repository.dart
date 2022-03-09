import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/entities.dart';
import '../domain/failure.dart';
import '../domain/i_repository.dart';
import 'api.dart';
import 'models.dart';

const _fakeCategories = [
  Catalogue(id: 1, name: 'Pet care'),
  Catalogue(id: 2, name: 'Babysitting'),
  Catalogue(id: 4, name: 'Furnishing'),
  Catalogue(id: 5, name: 'Washing'),
  Catalogue(id: 6, name: 'Cleaning'),
  // Catalogue(id: 7, name: 'Best Services'),
  // Catalogue(id: 8, name: 'Pet care'),
  // Catalogue(id: 9, name: 'Pet care'),
  // Catalogue(id: 10, name: 'Pet care'),
  // Catalogue(id: 11, name: 'Pet care'),
];

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
  Future<Option<Service>> getServiceDetail({int? id}) async {
    // try {
    //   await Future.delayed(const Duration(milliseconds: 400));
    //   return optionOf(Service.random());
    // } catch (_) {
    //   return optionOf(null);
    // }
    // return Future.delayed(const Duration(milliseconds: 400))
    //     .then((_) => optionOf(Service.random()));
    try {
      final response = await _serviceApi.getDetail(1);

      if (!response.valid) return none();

      return optionOf(Service.random());
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

// if (!response.valid) return left(const ServiceFailure.serverError());
// return optionOf(catalogues);
// return right(catalogues..addAll(_fakeCategories));
// return left(const ServiceFailure.serverError());