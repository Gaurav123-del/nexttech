import 'package:flutter/material.dart';
import 'ai_referral_result_screen.dart';

class PatientReferralForm extends StatelessWidget {
  const PatientReferralForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      appBar: AppBar(
        title: const Text("Patient Referral Form"),
        backgroundColor: const Color(0xff3F51B5),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🩺 DISEASE FIELD
            _input("Disease / Injury", Icons.medical_services),

            const SizedBox(height: 12),

            _input("Blood Pressure", Icons.favorite),

            const SizedBox(height: 12),

            _input("Oxygen Level", Icons.air),

            const SizedBox(height: 12),

            _input("Heart Rate", Icons.monitor_heart),

            const SizedBox(height: 12),

            _input("Required Treatment (ICU / Surgery)", Icons.local_hospital),

            const SizedBox(height: 30),

            /// 🤖 CHECK AI BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3F51B5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  /// 👉 GO TO TOP 5 HOSPITAL RESULT SCREEN
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AIReferralResultScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Check AI Hospitals",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// ✨ REUSABLE INPUT
  Widget _input(String hint, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}