import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:app_user/core/core.dart';
import 'cart_failure.dart';
import 'cart_item.dart';

abstract class ICartRepository {
  Future<void> clear();
  Option<KtList<CartItem>> all();
  Future<Either<CartFailure, Unit>> delete(UniqueId id);
  Future<Either<CartFailure, Unit>> create(CartItem item);
  Future<Either<CartFailure, Unit>> update(CartItem item);
  Stream<Either<CartFailure, KtList<CartItem>>> watchAll();
}


  // Future<Option<KtList<CartItem>>> watch();
