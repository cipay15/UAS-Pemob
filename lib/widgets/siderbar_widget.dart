import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black, // Monochrome black background
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Sidebar header or profile section
          UserAccountsDrawerHeader(
            accountName: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Syifa Rahmadani',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'H1D022096', // Student ID added here
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            accountEmail: null, // Email removed
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.black),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[850],
            ),
          ),
          
          // Dashboard section with icon
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.white),
            title: Text(
              'Dashboard',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Get.toNamed('/dashboard'),
          ),
          
          // Cashier section with icon
          ListTile(
            leading: Icon(Icons.receipt, color: Colors.white),
            title: Text(
              'Cashier',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Get.toNamed('/cashier'),
          ),
          
          // Logout section with icon
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Get.offAllNamed('/login'),
          ),
          
          // Additional space or settings (optional)
          Divider(color: Colors.white30),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Get.toNamed('/settings'),
          ),
        ],
      ),
    );
  }
}
