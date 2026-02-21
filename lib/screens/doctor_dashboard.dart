import 'package:flutter/material.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      body: Column(
        children: [

          /// 🔵 CURVED MEDICAL HEADER
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
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Doctor Dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "AI Powered Rural Referral System",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          /// ⚪ MAIN CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔴 EMERGENCY REFERRAL CARD
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.emergency,
                            color: Colors.white, size: 34),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "Start Emergency Referral",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Start",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "AI Risk Overview",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  /// 📊 STATS GRID
                  Row(
                    children: [
                      Expanded(child: _statCard("Today's Cases", "12", Icons.people)),
                      const SizedBox(width: 12),
                      Expanded(child: _statCard("Critical", "3", Icons.warning)),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(child: _statCard("Referred", "8", Icons.send)),
                      const SizedBox(width: 12),
                      Expanded(child: _statCard("Available Beds", "5", Icons.bed)),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// 🤖 AI REFERRAL INTELLIGENCE CARD
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.auto_awesome, color: Colors.blue, size: 30),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "AI analyzes patient severity, hospital capacity, and transport feasibility to suggest the safest referral path.",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Recent Activity",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  _activityTile("Trauma Case Referred", "District Hospital A"),
                  _activityTile("ICU Case Critical", "Medical Center B"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🧩 STAT CARD
  Widget _statCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          )
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(height: 10),
          Text(value,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  /// 🧾 ACTIVITY TILE
  Widget _activityTile(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.history, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$title\n$subtitle",
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}