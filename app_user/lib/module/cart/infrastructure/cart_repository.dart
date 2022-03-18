import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  CartRepository(this._logger, this._storage);

  final Logger _logger;
  final FlutterSecureStorage _storage;

  Future<KtList<CartItem>?> get _cachedItems => _readFromStorage();

  @override
  Future<void> clear() => Future.wait([_clearStorage()]);

  @override
  Future<Option<KtList<CartItem>>> all() async {
    try {
      return optionOf(await _cachedItems);
    } catch (e) {
      _logger.e(e);
    }
    return none();
  }

  @override
  Future<Either<CartFailure, Unit>> delete(UniqueId id) async {
    final idStr = id.getOrCrash();

    // cachedItems?.removeWhere((item) => item.id.getOrCrash() == idStr);
    try {
      final cachedItems = await _cachedItems;
      final newItems =
          cachedItems?.filterNot((item) => item.id.getOrCrash() == idStr);

      await _writeToStorage(newItems!);

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unableDelete());
  }

  @override
  Future<Either<CartFailure, Unit>> create(CartItem item) async {
    try {
      final cachedItems = await _cachedItems ?? emptyList();
      await _writeToStorage(cachedItems.plusElement(item));

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unableCreate());
  }

  @override
  Future<Either<CartFailure, Unit>> update(CartItem item) async {
    final idStr = item.id.getOrCrash();

    try {
      final cachedItems = await _cachedItems;
      final newItems = cachedItems!.map((element) {
        return idStr == element.id.getOrCrash() ? item : element;
      });

      await _writeToStorage(newItems);

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const CartFailure.unableUpdate());
  }

  Future<void> _clearStorage() => _storage.delete(key: cartKey);

  Future<void> _writeToStorage(KtList<CartItem> items) {
    final itemsDto = items.map((item) => item.toDto()).toList();
    final itemsJson = itemsDto.map((item) => item.toJson()).asList();
    final itemsEncode = jsonEncode(itemsJson);

    return _storage.write(key: cartKey, value: itemsEncode);
  }

  Future<KtList<CartItem>?> _readFromStorage() async {
    final itemsEncode = await _storage.read(key: cartKey);

    _logger.i(itemsEncode);

    if (itemsEncode != null) {
      final itemsDecode = (jsonDecode(itemsEncode) as List<dynamic>?);
      final items = itemsDecode?.map((itemJson) {
        return CartItemDto.fromJson(itemJson).toDomain();
      }).toList();

      return KtList.from(items!);
    }

    return null;
  }
}
