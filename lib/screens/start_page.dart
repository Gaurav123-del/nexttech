import 'package:flutter/material.dart';
import 'signup_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  // 👉 Navigate to Signup Page
  void goToSignup() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const SignupPage(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      body: SafeArea(
        child: Column(
          children: [

            // 🔄 SWIPE ONBOARDING
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);

                  // 👉 Last page → Signup
                  if (index == 4) {
                    goToSignup();
                  }
                },
                children: const [
                  OnboardPage(
                    image: "assets/images/smart_referral.png",
                    title: "Smart Referral",
                    subtitle: "AI helps doctors find best hospitals",
                  ),
                  OnboardPage(
                    image: "assets/images/facility_check.png",
                    title: "Live Facility Check",
                    subtitle: "Check ICU, Oxygen & Doctors instantly",
                  ),
                  OnboardPage(
                    image: "assets/images/risk_analysis.png",
                    title: "Risk Level Analysis",
                    subtitle: "Know urgency before transfer",
                  ),
                  OnboardPage(
                    image: "assets/images/workflow.png",
                    title: "Emergency Workflow",
                    subtitle: "Save time during critical situations",
                  ),
                  OnboardPage(
                    image: "assets/images/doctor.png",
                    title: "Ready to Start",
                    subtitle: "Begin smart referral with AI support",
                  ),
                ],
              ),
            ),

            // ⚪ INDICATOR DOTS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4),
                  height: 8,
                  width: currentIndex == index ? 22 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.grey[700]
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ⏭ SKIP BUTTON
            TextButton(
              onPressed: goToSignup,
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// 📄 ONBOARD PAGE WIDGET
class OnboardPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 240,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}