import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to Point of Sale', // Changed text in the app bar
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,  // Dark background for app bar
      ),
      body: Container(
        color: Colors.grey[100], // Light gray background for a soft effect
        child: Padding(
          padding: EdgeInsets.all(20.0), // Increased padding for a more comfortable layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Changed to "Good to See You Again"
              Text(
                'Good to See You Again', // Updated welcome text
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Dark text for contrast
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40), // Adding space below the welcome text

              // Username Field
              TextField(
                onChanged: (value) => controller.username.value = value,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.black87, // Neutral dark gray color for label
                    fontWeight: FontWeight.w500,
                  ),
                  // Box styling (using shades of gray for borders)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 20),
              
              // Password Field
              TextField(
                onChanged: (value) => controller.password.value = value,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black87, // Neutral dark gray color for label
                    fontWeight: FontWeight.w500,
                  ),
                  // Box styling (using shades of gray for borders)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 30),
              
              // Login Button
              Center(
                child: ElevatedButton(
                  onPressed: controller.login,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800], // Dark gray button
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // Optional: Add a 'Forgot Password?' text below the button
              Center(
                child: TextButton(
                  onPressed: () {
                    // Implement Forgot Password logic here
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[700]), // Gray text for a subtle effect
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
