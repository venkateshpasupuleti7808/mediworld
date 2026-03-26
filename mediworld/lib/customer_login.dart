import 'package:flutter/material.dart';
import 'home_screen.dart';

class CustomerLogin extends StatefulWidget {
  const CustomerLogin({super.key});

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {

  final TextEditingController contactController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool otpSent = false;
  String generatedOtp = "";

  void sendOtp() {
    generatedOtp = "1234"; // demo OTP

    setState(() {
      otpSent = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP Sent: 1234")),
    );
  }

  void verifyOtp() {
    if (otpController.text == generatedOtp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(userType: "Customer"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text("Customer Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: contactController,
              decoration: const InputDecoration(
                labelText: "Email or Phone",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            if (!otpSent)
              ElevatedButton(
                onPressed: sendOtp,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Color(0xFF5DADE2),
                ),
                child: const Text("Send OTP"),
              ),

            if (otpSent) ...[
              TextField(
                controller: otpController,
                decoration: const InputDecoration(
                  labelText: "Enter OTP",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: verifyOtp,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Color(0xFF28A745),
                ),
                child: const Text("Verify OTP"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}