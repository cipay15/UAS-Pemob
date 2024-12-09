import 'package:get/get.dart';

class DashboardController extends GetxController {
  var totalSales = 0.0.obs;
  var totalTransactions = 0.obs;

  var salesData = List<double>.filled(7, 0.0).obs;

  var monthlySalesData = List<double>.filled(12, 0.0).obs;

  void updateSales(double amount) {
    totalSales.value += amount;
    totalTransactions.value++;

    int todayIndex = DateTime.now().weekday - 1;
    salesData[todayIndex] += amount;

    int currentMonth = DateTime.now().month - 1;
    monthlySalesData[currentMonth] += amount;
  }
}
