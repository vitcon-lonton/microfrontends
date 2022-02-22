import 'package:dartz/dartz.dart';

import 'package:service/domain/entities.dart';
import 'package:service/domain/failure.dart';
import 'package:service/domain/i_repository.dart';

import 'api.dart';
import 'models.dart';

const _fakeServices = [
  Service(name: 'Interior Wall Painting'),
  Service(name: 'Pet Sitting service'),
  Service(name: 'Thermostai Installation'),
  Service(name: 'Bedroom Cleaning'),
  Service(name: 'Car Washing'),
  Service(name: 'Men\'s fancy hair culling'),
  Service(name: 'House Cleaning Services'),
  Service(name: 'Get spa at home'),
  Service(name: 'Computer & Server AMC Service'),
  Service(name: 'Women Hair Cutting'),
];

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
  Future<Either<ServiceFailure, Service>> getServiceDetail() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(_fakeServices.first);
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

      // return right(catalogues);
      return right(catalogues..addAll(_fakeCategories));
    } catch (_) {
      return left(const ServiceFailure.serverError());
    }
  }

  @override
  Future<Either<ServiceFailure, List<Service>>> getServices() async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      return right(_fakeServices);
    } catch (_) {
      return left(const ServiceFailure.serverError());
    }
  }
}
