import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/order/shopping_card/shopping_card_controller.dart';
import 'package:vakinha_burger/app/repositories/order/order_repository.dart';
import 'package:vakinha_burger/app/repositories/order/order_repository_impl.dart';

class ShoppingCardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(
        () => OrderRepositoryImpl(restClient: Get.find()));
    Get.put(ShoppingCardController(
        authService: Get.find(),
        shoppingCardService: Get.find(),
        orderRepository: Get.find()));
  }
}
