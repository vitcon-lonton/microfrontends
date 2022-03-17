import '../domain/cart_item.dart';
import 'cart_item_dto.dart';

extension CartItemDtoX on CartItemDto {
  CartItem toDomain() => CartItem.random();
}

extension CartItemDomainX on CartItem {
  CartItemDto toDto() {
    return CartItemDto(
      time: time,
      id: id.getOrCrash(),
      serviceId: serviceId,
      timeOfDay: DateTime.now(),
    );
  }
}
