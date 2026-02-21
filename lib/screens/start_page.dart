// import 'package:flutter/material.dart';
// import 'signup_page.dart';

// class StartPage extends StatefulWidget {
//   const StartPage({super.key});

//   @override
//   State<StartPage> createState() => _StartPageState();
// }

// class _StartPageState extends State<StartPage> {
//   final PageController _controller = PageController();
//   int currentIndex = 0;

//   void goToSignup() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (_) => const SignupPage(),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffEEF2F8),
//       body: SafeArea(
//         child: Column(
//           children: [

//             /// 🔄 SWIPE PAGES
//             Expanded(
//               child: PageView(
//                 controller: _controller,
//                 onPageChanged: (index) {
//                   setState(() => currentIndex = index);

//                   if (index == 4) {
//                     goToSignup();
//                   }
//                 },
//                 children: const [
//                   OnboardPage(
//                     image: "assets/images/smart_referral.png",
//                     title: "Smart Referral",
//                     subtitle:
//                         "AI helps doctors quickly find the best hospitals for emergency care",
//                   ),
//                   OnboardPage(
//                     image: "assets/images/facility_check.png",
//                     title: "Live Facility Check",
//                     subtitle:
//                         "Instantly verify ICU beds, oxygen supply and specialist doctors",
//                   ),
//                   OnboardPage(
//                     image: "assets/images/risk_analysis.png",
//                     title: "Risk Level Analysis",
//                     subtitle:
//                         "Understand patient urgency with intelligent risk assessment",
//                   ),
//                   OnboardPage(
//                     image: "assets/images/workflow.png",
//                     title: "Emergency Workflow",
//                     subtitle:
//                         "Streamline referral decisions during critical situations",
//                   ),
//                   OnboardPage(
//                     image: "assets/images/doctor.png",
//                     title: "Ready to Start",
//                     subtitle:
//                         "Begin AI powered rural referral support today",
//                   ),
//                 ],
//               ),
//             ),

//             /// ⚪ PAGE INDICATOR
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 5,
//                 (index) => AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   margin: const EdgeInsets.all(4),
//                   height: 8,
//                   width: currentIndex == index ? 24 : 8,
//                   decoration: BoxDecoration(
//                     color: currentIndex == index
//                         ? Colors.blue
//                         : Colors.blue.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// ⏭ SKIP BUTTON
//             TextButton(
//               onPressed: goToSignup,
//               child: const Text(
//                 "Skip",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// 📄 ONBOARD PAGE
// class OnboardPage extends StatelessWidget {
//   final String image;
//   final String title;
//   final String subtitle;

//   const OnboardPage({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 26),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [

//           /// 🖼 BIG IMAGE
//           Image.asset(
//             image,
//             height: 320, // 🔥 Increased size
//             fit: BoxFit.contain,
//           ),

//           const SizedBox(height: 40),

//           /// 🧠 BIG TITLE
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 32, // 🔥 Bigger
//               fontWeight: FontWeight.bold,
//               color: Color(0xff1C1C1C),
//             ),
//           ),

//           const SizedBox(height: 16),

//           /// ✨ BIG SUBTITLE
//           Text(
//             subtitle,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 18, // 🔥 Bigger
//               height: 1.4,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:rural_referral_app/screens/signup_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  void goToSignUp() {
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
      backgroundColor: const Color(0xffEEF2F8),
      body: SafeArea(
        child: Column(
          children: [

            /// 🔄 ONBOARDING PAGES
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                children: const [
                  OnboardPage(
                    image: "assets/images/smart_referral.png",
                    title: "Smart Referral",
                    subtitle:
                        "AI helps doctors quickly find the best hospitals for emergency care",
                  ),
                  OnboardPage(
                    image: "assets/images/facility_check.png",
                    title: "Live Facility Check",
                    subtitle:
                        "Instantly verify ICU beds, oxygen supply and specialist doctors",
                  ),
                  OnboardPage(
                    image: "assets/images/risk_analysis.png",
                    title: "Risk Level Analysis",
                    subtitle:
                        "Understand patient urgency with intelligent risk assessment",
                  ),
                  OnboardPage(
                    image: "assets/images/workflow.png",
                    title: "Emergency Workflow",
                    subtitle:
                        "Streamline referral decisions during critical situations",
                  ),
                  OnboardPage(
                    image: "assets/images/doctor.png",
                    title: "Ready to Start",
                    subtitle:
                        "Begin AI powered rural referral support today",
                  ),
                ],
              ),
            ),

            /// ⚪ PAGE INDICATOR
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4),
                  height: 8,
                  width: currentIndex == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.blue
                        : Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// ✅ SKIP BUTTON ONLY ON LAST PAGE
            if (currentIndex == 4)
              TextButton(
                onPressed: goToSignUp,
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
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

/// 📄 ONBOARD PAGE
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /// 🖼 BIG IMAGE
          Image.asset(
            image,
            height: 320,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 40),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              height: 1.4,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}