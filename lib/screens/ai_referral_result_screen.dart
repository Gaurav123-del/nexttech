import 'package:flutter/material.dart';

class AIReferralResultScreen extends StatelessWidget {
  const AIReferralResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),

      /// 🔵 GRADIENT HEADER
      body: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff3F51B5),
                  Color(0xff2196F3),
                ],
              ),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(45)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "AI Referral Results",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  "Top 5 Recommended Hospitals",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          /// ⚪ RESULTS LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [

                /// ⭐ HOSPITAL CARD 1
                _HospitalCard(
                  hospitalName: "District Hospital A",
                  distance: "18 km • 22 min",
                  doctor: "Trauma Specialist Available",
                  risk: "LOW",
                ),

                _HospitalCard(
                  hospitalName: "Medical Center B",
                  distance: "12 km • 15 min",
                  doctor: "Cardiac Doctor Available",
                  risk: "MEDIUM",
                ),

                _HospitalCard(
                  hospitalName: "City Care Hospital",
                  distance: "25 km • 30 min",
                  doctor: "ICU Specialist Available",
                  risk: "LOW",
                ),

                _HospitalCard(
                  hospitalName: "Regional Health Hub",
                  distance: "32 km • 40 min",
                  doctor: "General Surgeon Available",
                  risk: "CRITICAL",
                ),

                _HospitalCard(
                  hospitalName: "Emergency Medical Unit",
                  distance: "10 km • 12 min",
                  doctor: "Emergency Physician Available",
                  risk: "MEDIUM",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// 🏥 ULTRA HOSPITAL CARD
class _HospitalCard extends StatelessWidget {
  final String hospitalName;
  final String distance;
  final String doctor;
  final String risk;

  const _HospitalCard({
    required this.hospitalName,
    required this.distance,
    required this.doctor,
    required this.risk,
  });

  Color getRiskColor() {
    switch (risk) {
      case "LOW":
        return Colors.green;
      case "MEDIUM":
        return Colors.orange;
      case "CRITICAL":
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🏥 HEADER ROW
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xffE3F2FD),
                child: Icon(Icons.local_hospital, color: Colors.blue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  hospitalName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: getRiskColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  risk,
                  style: TextStyle(
                    color: getRiskColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 12),

          /// 📍 DISTANCE
          Row(
            children: [
              const Icon(Icons.location_on,
                  size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text(distance,
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 6),

          /// 👨‍⚕️ DOCTOR
          Row(
            children: [
              const Icon(Icons.person, size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text(doctor),
            ],
          ),

          const SizedBox(height: 12),

          /// 🧩 FACILITY TAGS
          Wrap(
            spacing: 8,
            children: const [
              _FacilityChip("ICU"),
              _FacilityChip("Oxygen"),
              _FacilityChip("OT"),
              _FacilityChip("Blood"),
            ],
          ),

          const SizedBox(height: 12),

          /// 🤖 AI REASONING TEXT
          const Text(
            "AI Reasoning: Based on patient vitals and facility readiness, this hospital offers the safest referral path.",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

/// 🧩 FACILITY CHIP
class _FacilityChip extends StatelessWidget {
  final String text;
  const _FacilityChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xffE3F2FD),
      label: Text(text,
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold)),
    );
  }
}