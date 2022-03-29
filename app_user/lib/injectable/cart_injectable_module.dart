import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/cart/cart.dart';

@module
abstract class CartInjectableModule {
  @Injectable()
  CartAllCubit get all;

  @Injectable()
  CartItemFormCubit get form;

  @Injectable()
  CartWatcherCubit get watcher;

  @Injectable()
  CartItemDeleteCubit get delete;

  @Injectable()
  CartItemCreateCubit get create;

  @Injectable()
  CartItemUpdateCubit get update;

  @LazySingleton(as: ICartRepository)
  CartRepository get repository;

  @lazySingleton
  Box<CartItemDto> get box => Hive.box<CartItemDto>(cartKey);
}
