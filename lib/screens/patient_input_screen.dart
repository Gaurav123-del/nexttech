import 'package:flutter/material.dart';

class PatientInputScreen extends StatelessWidget {
  const PatientInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patient Details")),
      body: const Center(
        child: Text("Patient Form Coming Next"),
      ),
    );
  }
}