import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';
import '../widgets/siderbar_widget.dart';

class CashierView extends StatelessWidget {
  final CashierController controller = Get.put(CashierController());

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cashier',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200], // Light grey background for the body
      drawer: SidebarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input for Product Name
            _buildTextField(
              controller: nameController,
              label: 'Nama Produk',
            ),
            SizedBox(height: 16),

            // Input for Price
            _buildTextField(
              controller: priceController,
              label: 'Harga',
              isNumber: true,
            ),
            SizedBox(height: 20),

            // Add Product Button (Monochrome)
            _buildButton(
              onPressed: () {
                controller.addProduct(
                  nameController.text,
                  double.tryParse(priceController.text) ?? 0.0,
                );
              },
              label: 'Tambah Produk',
              color: Colors.grey[600]!, // Darker gray for the button
            ),
            SizedBox(height: 20),

            // Product List
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    final product = controller.productList[index];
                    return _buildProductListTile(product);
                  },
                );
              }),
            ),

            SizedBox(height: 20),

            // Total Price Display
            Obx(() {
              return Text(
                'Total Harga: \Rp ${controller.totalPrice.value}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87, // Dark gray for text
                ),
              );
            }),
            SizedBox(height: 20),

            // Complete Transaction Button (Monochrome)
            _buildButton(
              onPressed: controller.completeTransaction,
              label: 'Selesaikan Transaksi',
              color: Colors.grey[700]!,  // Medium gray for button
            ),
          ],
        ),
      ),
    );
  }

  // Reusable TextField widget with monochrome colors
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isNumber = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: TextStyle(color: Colors.black87), // Dark gray text color
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]), // Lighter gray for label
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[500]!), // Gray border
        ),
      ),
    );
  }

  // Reusable button widget with monochrome style
  Widget _buildButton({
    required VoidCallback onPressed,
    required String label,
    required Color color,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,  // Monochrome button color
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Smaller padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),  // Rounded corners
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,  // Smaller font size for a compact look
        ),
      ),
    );
  }

  // Reusable Product List Tile widget with monochrome theme
  Widget _buildProductListTile(product) {
    return ListTile(
      title: Text(
        product.nama,
        style: TextStyle(color: Colors.black87), // Dark gray for text
      ),
      subtitle: Text(
        '\Rp${product.harga}',
        style: TextStyle(color: Colors.black54), // Lighter gray for subtitle
      ),
    );
  }
}
