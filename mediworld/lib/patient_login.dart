import 'package:flutter/material.dart';
import 'home_screen.dart';

class PatientLogin extends StatefulWidget {
  const PatientLogin({super.key});

  @override
  State<PatientLogin> createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool otpSent = false;
  String generatedOtp = "";

  void sendOtp() {
    generatedOtp = "5678"; // demo OTP

    setState(() {
      otpSent = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP Sent: 5678")),
    );
  }

  void verifyOtp() {
    if (otpController.text == generatedOtp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(userType: "Patient"),
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
      appBar: AppBar(title: const Text("Patient Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: "Mobile Number",
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