import 'package:flutter/material.dart';
import 'package:rural_referral_app/screens/login_up.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        /// ✅ WORKING BACK BUTTON
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Dr. Sanjay Gupta",
          style: TextStyle(color: Colors.black),
        ),

        actions: [

          /// ❤️ Favorite
          const Icon(Icons.favorite_border, color: Colors.black),
          const SizedBox(width: 14),

          /// 🔗 Share
          const Icon(Icons.share, color: Colors.black),
          const SizedBox(width: 14),

          /// 🚪 LOGOUT BUTTON (NEW)
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
                (route) => false,
              );
            },
          ),

          const SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 👨‍⚕️ TOP CARD
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/doctorni.png",
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Sanjay Gupta",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Neurosurgery"),
                      SizedBox(height: 4),
                      Text(
                        "📍 New York, United States",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 22),

            /// ⭐ STATS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _StatItem("5000+", Icons.people),
                _StatItem("4.9", Icons.star),
                _StatItem("35,778", Icons.chat),
              ],
            ),

            const SizedBox(height: 26),

            /// 🧾 DESCRIPTION
            const Text(
              "Descriptions",
              style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Neurosurgery services encompass a wide range of medical treatments and surgical interventions aimed at diagnosing, treating, and managing disorders of the brain, spine, and nervous system.",
              style: TextStyle(color: Colors.grey),
            ),

            const Divider(height: 28),

            /// 💰 CHARGES
            const Text(
              "Consultation Charges",
              style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text("\$50/hr"),

            const Divider(height: 28),

            /// ⏰ HOURS
            const Text(
              "Available Hours",
              style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "Monday to Friday , 02:00 AM to 08:30 PM",
              style: TextStyle(color: Colors.grey),
            ),

            const Divider(height: 28),

            /// ⭐ REVIEWS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Reviews",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "See All",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String text;
  final IconData icon;
  const _StatItem(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffECEAFF),
          child: Icon(icon, color: Colors.deepPurple),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}