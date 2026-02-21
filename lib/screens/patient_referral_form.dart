import 'package:flutter/material.dart';
import 'dart:ui';
import 'ai_referral_result_screen.dart';

class PatientReferralForm extends StatelessWidget {
  const PatientReferralForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9DA5B5),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Patient Referral Form"),
        backgroundColor: const Color.fromARGB(255, 83, 110, 151),
      ),
      body: Stack(
        children: [

          /// 🔥 SOFT GLASS BACKGROUND EFFECT
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 157, 165, 181),
                  Color.fromARGB(255, 215, 220, 230),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [

                /// 🩺 DISEASE FIELD
                GlassInput("Disease / Injury", Icons.medical_services),
                const SizedBox(height: 14),

                GlassInput("Blood Pressure", Icons.favorite),
                const SizedBox(height: 14),

                GlassInput("Oxygen Level", Icons.air),
                const SizedBox(height: 14),

                GlassInput("Heart Rate", Icons.monitor_heart),
                const SizedBox(height: 14),

                GlassInput(
                  "Required Treatment (ICU / Surgery)",
                  Icons.local_hospital,
                ),

                const SizedBox(height: 30),

                /// 🤖 GLASS BUTTON
                GlassButton(
                  text: "Check AI Hospitals",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AIReferralResultScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ⭐ GLASS INPUT FIELD
class GlassInput extends StatelessWidget {
  final String hint;
  final IconData icon;

  const GlassInput(this.hint, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: TextField(
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: const Color(0xff536E97)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.75),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔵 GLASS BUTTON
class GlassButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const GlassButton({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 83, 110, 151).withOpacity(0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            onPressed: onTap,
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}