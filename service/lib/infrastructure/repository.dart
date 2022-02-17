import 'package:dartz/dartz.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';

import 'api.dart';
import 'models.dart';

const _services = [
  Service(name: 'Service 1'),
  Service(name: 'Service 2'),
  Service(name: 'Service 3'),
  Service(name: 'Service 4'),
  Service(name: 'Service 5'),
  Service(name: 'Service 6'),
];

class ServiceRepository implements IServiceRepository {
  final CatalogueApi _api;

  const ServiceRepository(this._api);

  @override
  Future<Either<ServiceFailure, Unit>> book(Service service) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } catch (_) {
      return left(const ServiceFailure.serverError());
    }
  }

  @override
  Future<Either<ServiceFailure, List<Catalogue>>> getCatalogues() async {
    try {
      final response = await _api.getCatalogues();

      if (!response.valid) return left(const ServiceFailure.serverError());

      final data = response.data;
      final catalogues = data!.map((catalogue) {
        return catalogue.toDomain();
      }).toList();

      return right(catalogues);
    } catch (_) {
      return left(const ServiceFailure.serverError());
    }
  }

  @override
  Future<Either<ServiceFailure, List<Service>>> getServices() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(_services);
    } catch (_) {
      return left(const ServiceFailure.serverError());
    }
  }
}
