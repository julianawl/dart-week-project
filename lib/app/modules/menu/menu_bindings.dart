import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/menu/menu_controller.dart';
import 'package:vakinha_burger/app/repositories/products/product_repository.dart';
import 'package:vakinha_burger/app/repositories/products/product_repository_impl.dart';

class MenuBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
        () => ProductRepositoryImpl(restClient: Get.find()));
    Get.put(MenuController(productRepository: Get.find()));
  }
}
