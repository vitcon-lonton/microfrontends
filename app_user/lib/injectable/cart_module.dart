import 'package:injectable/injectable.dart';

import '../module/cart/cart.dart';

@module
abstract class CartModule {
  @Injectable()
  CartAllCubit get all;

  @Injectable()
  CartDeleteCubit get delete;

  @Injectable()
  CartCreateCubit get create;

  @LazySingleton(as: ICartRepository)
  CartRepository get repository;
}
