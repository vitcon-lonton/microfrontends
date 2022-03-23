import '../domain/domain.dart';
import 'api/api.dart';

extension CatalogueDtoExt on CatalogueDto {
  Catalogue toDomain() => Catalogue.fromJson(toJson());
}
