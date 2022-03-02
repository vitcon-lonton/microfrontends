import 'package:dartz/dartz.dart';
import 'package:engine/pagination.dart';
import 'package:service/service.dart';

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
      await Future.delayed(const Duration(milliseconds: 400));
      return right(unit);
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
    return Future.delayed(const Duration(milliseconds: 400))
        .then((_) => optionOf(Service.random()));
  }

  @override
  Future<Option<List<Catalogue>>> getCatalogues() async {
    try {
      final response = await _api.getCatalogues();

      await Future.delayed(const Duration(milliseconds: 800));

      if (!response.valid) {
        return optionOf(null);
      }

      final catalogues = response.data!.map((catalogue) {
        return catalogue.toDomain();
      }).toList();

      return optionOf(catalogues..addAll(_fakeCategories));
    } catch (_) {
      return optionOf(null);
    }
  }

  @override
  Future<Option<Pagination<Service>>> getServices(
      {required int page, required int perPage}) async {
    await Future.delayed(const Duration(milliseconds: 400));

    const pageCount = 5;
    final totalCount = perPage * 5;
    final data = List.generate(perPage, (index) => Service.random());

    final result = Pagination<Service>(
        data: data,
        page: page,
        perPage: perPage,
        pageCount: pageCount,
        totalCount: totalCount);

    return optionOf(result);
  }
}

// if (!response.valid) return left(const ServiceFailure.serverError());
// return optionOf(catalogues);
// return right(catalogues..addAll(_fakeCategories));
// return left(const ServiceFailure.serverError());