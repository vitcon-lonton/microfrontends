import 'package:injectable/injectable.dart';

import '../module/cart/cart.dart';

@module
abstract class CartModule {
  @Injectable()
  CartCubit get cart;

  @LazySingleton(as: ICartRepository)
  CartRepository get repository;
}
