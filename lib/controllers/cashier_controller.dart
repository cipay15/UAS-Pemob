import 'package:get/get.dart';
import '../models/product_model.dart';
import '../controllers/dashboard_controller.dart';

class CashierController extends GetxController {
  var productList = <Product>[].obs;
  var totalPrice = 0.0.obs;

  final DashboardController dashboardController =
      Get.find<DashboardController>();

  void addProduct(String name, double price) {
    if (name.isNotEmpty && price > 0) {
      productList.add(Product(nama: name, harga: price));
      totalPrice.value += price;
    }
  }

  void completeTransaction() {
    if (productList.isNotEmpty) {
      dashboardController.updateSales(totalPrice.value);

      productList.clear();
      totalPrice.value = 0.0;

      Get.snackbar('Success', 'Transaksi Berhasil');
    } else {
      Get.snackbar('Error', 'Transaksi Gagal!');
    }
  }
}
