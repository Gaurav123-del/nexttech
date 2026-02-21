import 'package:flutter/material.dart';
import 'patient_referral_form.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      body: Column(
        children: const [
          ConsultationHeader(),
          Expanded(child: DashboardBody()),
        ],
      ),
    );
  }
}

/// 🔵 CONSULTATION STYLE HEADER
class ConsultationHeader extends StatelessWidget {
  const ConsultationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff3F51B5), Color.fromARGB(255, 53, 132, 197)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP ROW
          Row(
            children: const [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue),
              ),
              Spacer(),
              Text(
                "Consultation",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.menu, color: Colors.white, size: 35),
            ],
          ),

          SizedBox(height: 25),

          /// TITLE
          Text(
            "Find Your Desired\nSpecialist",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          /// SEARCH BAR
          _SearchBar(),
        ],
      ),
    );
  }
}

/// 🔍 SEARCH BAR WIDGET
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search specialist or hospital",
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}

/// ⚪ DASHBOARD BODY
class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          EmergencyCard(),

          SizedBox(height: 24),

          Text(
            "AI Risk Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 12),

          StatGrid(),

          SizedBox(height: 24),

          Text(
            "Recent AI Referrals",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 12),

          ActivityTile(
            title: "Trauma Case Referred",
            subtitle: "District Hospital A",
          ),
          ActivityTile(
            title: "Cardiac Case Critical",
            subtitle: "Medical Center B",
          ),
        ],
      ),
    );
  }
}

/// 🚨 EMERGENCY CARD
class EmergencyCard extends StatelessWidget {
  const EmergencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red.shade400, Colors.red.shade300],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.emergency, color: Colors.white, size: 34),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Start AI Emergency Referral",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientReferralForm()),
              );
            },
            child: const Text("Start", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

/// 📊 STAT GRID
class StatGrid extends StatelessWidget {
  const StatGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Row(
          children: [
            Expanded(child: StatCard("Today's Cases", "12", Icons.people)),
            SizedBox(width: 12),
            Expanded(child: StatCard("Critical", "3", Icons.warning)),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: StatCard("Referred", "8", Icons.send)),
            SizedBox(width: 12),
            Expanded(child: StatCard("Beds", "5", Icons.bed)),
          ],
        ),
      ],
    );
  }
}

/// 🧩 STAT CARD
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard(this.title, this.value, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffE3F2FD),
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

/// 🧾 ACTIVITY TILE
class ActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const ActivityTile({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xffE3F2FD),
            child: Icon(Icons.history, color: Colors.blue),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text("$title\n$subtitle")),
        ],
      ),
    );
  }
}
