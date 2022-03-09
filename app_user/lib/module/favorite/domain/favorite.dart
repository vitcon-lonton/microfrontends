import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite.freezed.dart';

@freezed
class Favorite with _$Favorite {
  const factory Favorite(
      {required UniqueId id,
      required String name,
      required double price,
      required DateTime time}) = _Favorite;

  factory Favorite.random() {
    final _id = UniqueId();

    return Favorite(
      id: _id,
      price: 2000000,
      time: DateTime.now(),
      name: 'Service name ${_id.value.foldRight('', (id, previous) => id)}',
    );
  }
}
