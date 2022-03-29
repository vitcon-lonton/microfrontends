import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:kt_dart/kt.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/cart_failure.dart';
import '../domain/cart_item.dart';
import '../domain/i_cart_repository.dart';
import 'cart_item_dto.dart';
import 'cart_item_mapper.dart';

const cartKey = 'CART';

class CartRepository implements ICartRepository {
  CartRepository(this._logger, this._box);

  final Logger _logger;
  final Box<CartItemDto> _box;

  @override
  Future<void> clear() => _box.clear();

  @override
  Option<KtList<CartItem>> all() {
    try {
      return optionOf(
        KtList.from(_box.values.map((item) => item.toDomain()).toList()),
      );
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Either<CartFailure, Unit>> delete(UniqueId id) async {
    final idStr = id.getOrCrash();

    try {
      await _box.delete(idStr);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unableDelete());
  }

  @override
  Future<Either<CartFailure, Unit>> create(CartItem item) async {
    final dto = item.toDto();
    final idStr = item.id.getOrCrash();

    try {
      await _box.put(idStr, dto);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unableCreate());
  }

  @override
  Future<Either<CartFailure, Unit>> update(CartItem item) async {
    final dto = item.toDto();
    final idStr = item.id.getOrCrash();

    try {
      await _box.put(idStr, dto);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unableUpdate());
  }

  @override
  Stream<Either<CartFailure, KtList<CartItem>>> watchAll() {
    return _box.watch().map((event) {
      final list = all();

      return list.fold(() {
        return left(const CartFailure.unableCreate());
      }, (items) => right(items));
    });
  }
}
