import 'package:dartz/dartz.dart' hide Order;
import 'package:app_user/core/core.dart';

import 'entities.dart';
import 'failure.dart';

abstract class ICartRepository {
  Future<Option<List<CartItem>>> all();
  Future<Either<CartFailure, Unit>> clear();
  Future<Either<CartFailure, Unit>> delete(UniqueId id);
  Future<Either<CartFailure, Unit>> create({required CartItem item});
  Future<Either<CartFailure, Unit>> update({required CartItem item});
}
