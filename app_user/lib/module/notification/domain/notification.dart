import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

enum NotificationStatus { created, done, cancel }

@freezed
class Notification with _$Notification {
  const factory Notification(
          {required UniqueId id,
          required String name,
          required double price,
          required DateTime time,
          @Default(NotificationStatus.created) NotificationStatus status}) =
      _Notification;

  factory Notification.random() {
    final _id = UniqueId();

    return Notification(
      id: _id,
      price: 2000000,
      time: DateTime.now(),
      name: 'Service name ${_id.value.foldRight('', (id, previous) => id)}',
    );
  }
}
