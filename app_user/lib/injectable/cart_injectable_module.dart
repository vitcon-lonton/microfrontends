import 'package:injectable/injectable.dart';

import '../module/cart/cart.dart';

@module
abstract class CartInjectableModule {
  @Injectable()
  CartAllCubit get all;

  @Injectable()
  CartItemFormCubit get form;

  @Injectable()
  CartItemDeleteCubit get delete;

  @Injectable()
  CartItemCreateCubit get create;

  @Injectable()
  CartItemUpdateCubit get update;

  @LazySingleton(as: ICartRepository)
  CartRepository get repository;
}
