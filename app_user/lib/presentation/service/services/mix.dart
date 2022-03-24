part of 'services.dart';

extension FavoriteX on Favorite {
  Service toService() => Service.fromJson(toJson());
}
