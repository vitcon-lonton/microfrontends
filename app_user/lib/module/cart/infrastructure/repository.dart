import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import '../domain/entities.dart';
import '../domain/failure.dart';
import '../domain/i_repository.dart';

class CartRepository implements ICartRepository {
  late final List<CartItem> _items;

  CartRepository() {
    _items = [];
    _items.add(CartItem.random());
    _items.add(CartItem.random());
    _items.add(CartItem.random());
  }

  @override
  Future<Option<List<CartItem>>> all() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return optionOf(_items);
  }

  @override
  Future<Either<CartFailure, Unit>> clear() async {
    await Future.delayed(const Duration(milliseconds: 700));
    _items = [];
    return right(unit);
  }

  @override
  Future<Either<CartFailure, Unit>> delete(UniqueId id) async {
    await Future.delayed(const Duration(milliseconds: 700));
    final idStr = id.getOrCrash();
    _items.removeWhere((item) => item.id.getOrCrash() == idStr);
    return right(unit);
  }

  @override
  Future<Either<CartFailure, Unit>> create({required CartItem item}) async {
    await Future.delayed(const Duration(milliseconds: 700));
    _items.add(item);
    return right(unit);
  }

  @override
  Future<Either<CartFailure, Unit>> update({required CartItem item}) async {
    await Future.delayed(const Duration(milliseconds: 700));
    final idStr = item.id.getOrCrash();
    final index = _items.indexWhere((element) {
      return idStr == element.id.getOrCrash();
    });

    _items[index] = item;

    return right(unit);
  }
}
