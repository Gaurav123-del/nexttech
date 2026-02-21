import 'package:flutter/material.dart';
import 'package:rural_referral_app/screens/login_up.dart';
import 'doctor_dashboard.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F6FB),
      body: Stack(
        children: [

          // 🔵 TOP GRADIENT HEADER
          Container(
            height: 270,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff3F51B5),
                  Color.fromARGB(255, 55, 132, 196),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Icon(Icons.local_hospital,
                      color: Colors.white, size: 42),
                  SizedBox(height: 10),
                  Text(
                    "Rural Referral AI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Doctor Registration",
                    style: TextStyle(color: Colors.white70,fontSize: 15),
                  ),
                ],
              ),
            ),
          ),

          // ⚪ CURVED WHITE CONTAINER
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    const SizedBox(height: 50),

                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 👨‍⚕️ Doctor Name
                    buildInput(
                      hint: "Doctor Name",
                      icon: Icons.person,
                    ),

                    const SizedBox(height: 15),
                    buildInput(
                      hint: "Hospital Id ",
                      icon: Icons.person,
                    ),

                    const SizedBox(height: 15),

                    // 🏥 Hospital Name
                    buildInput(
                      hint: "Hospital Name",
                      icon: Icons.local_hospital,
                    ),

                    const SizedBox(height: 15),

                    // 📧 Email
                    buildInput(
                      hint: "Gmail",
                      icon: Icons.email,
                    ),

                    const SizedBox(height: 15),

                    // 🔒 Password
                    TextField(
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: const Color(0xffF3F6FB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // 🔵 CREATE ACCOUNT BUTTON
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff3F51B5),
                            Color.fromARGB(255, 59, 135, 197),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DoctorDashboard(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white,fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔁 GO TO LOGIN
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xff2196F3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✨ Reusable Input Widget
  Widget buildInput({required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: const Color(0xffF3F6FB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}