import 'package:flutter/material.dart';
import 'dart:ui';

class AIReferralResultScreen extends StatelessWidget {

  final String hospitalId;
  final String reason;

  const AIReferralResultScreen({
    super.key,
    required this.hospitalId,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9DA5B5),
      body: Stack(
        children: [

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

          Column(
            children: [

              Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 83, 110, 151),
                      Color.fromARGB(255, 136, 143, 153),
                    ],
                  ),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(45)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "AI Referral Results",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "Top Recommendation Based on AI",
                      style: TextStyle(color: Colors.white70),
                    ),

                    const SizedBox(height: 20),

                    /// 🟢 Dynamic AI Card
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 198, 235, 209)
                                .withOpacity(0.9),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                children: [
                                  const Icon(
                                    Icons.health_and_safety,
                                    color: Color(0xff2E7D32),
                                    size: 28,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      hospitalId,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1B5E20),
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              Text(
                                reason,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Center(
                  child: Text(
                    "More hospital suggestions coming soon...",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}