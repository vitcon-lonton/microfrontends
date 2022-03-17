import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/cart_failure.dart';
import '../domain/cart_item.dart';
import '../domain/i_cart_repository.dart';
import 'cart_item_dto.dart';
import 'cart_item_mapper.dart';

class CartRepository implements ICartRepository {
  static const cartKey = 'CART';

  final Logger _logger;
  final FlutterSecureStorage _storage;

  CartRepository(this._logger, this._storage) {
    // _writeToStorage(
    //   [CartItem.random(), CartItem.random(), CartItem.random()],
    // );
  }

  Future<void> _clearStorage() => _storage.delete(key: cartKey);

  Future<void> _writeToStorage(List<CartItem> items) {
    final itemsDto = items.map((item) => item.toDto()).toList();
    final itemsJson = itemsDto.map((item) => item.toJson()).toList();
    final itemsEncode = jsonEncode(itemsJson);

    return _storage.write(key: cartKey, value: itemsEncode);
  }

  Future<List<CartItem>?> _readFromStorage() async {
    final itemsEncode = await _storage.read(key: cartKey);
    final itemsDecode = (jsonDecode(itemsEncode!) as List<dynamic>?);
    final items = itemsDecode?.map((itemJson) {
      return CartItemDto.fromJson(itemJson).toDomain();
    }).toList();

    return items;
  }

  @override
  Future<Option<List<CartItem>>> all() async {
    try {
      final cachedItems = await _readFromStorage();
      if (cachedItems != null) return optionOf(cachedItems);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Either<CartFailure, Unit>> clear() async {
    try {
      await _clearStorage();
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unexpected());
  }

  @override
  Future<Either<CartFailure, Unit>> delete(UniqueId id) async {
    final idStr = id.getOrCrash();

    try {
      final cachedItems = await _readFromStorage();

      cachedItems?.removeWhere((item) => item.id.getOrCrash() == idStr);

      _writeToStorage(cachedItems!);

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unableDelete());
  }

  @override
  Future<Either<CartFailure, Unit>> create({required CartItem item}) async {
    try {
      final cachedItems = await _readFromStorage() ?? <CartItem>[];

      cachedItems.add(item);

      _writeToStorage(cachedItems);

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unableCreate());
  }

  @override
  Future<Either<CartFailure, Unit>> update({required CartItem item}) async {
    try {
      final cachedItems = await _readFromStorage() ?? <CartItem>[];

      final idStr = item.id.getOrCrash();
      final index = cachedItems.indexWhere((element) {
        return idStr == element.id.getOrCrash();
      });

      cachedItems[index] = item;

      _writeToStorage(cachedItems);

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unableUpdate());
  }
}
