
import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/product_detail/product_detail_controller.dart';

class ProductDetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductDetailController(shoppingCardService: Get.find()));
  }

}