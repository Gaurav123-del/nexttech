
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'ai_referral_result_screen.dart';

class PatientReferralForm extends StatefulWidget {
  const PatientReferralForm({super.key});

  @override
  State<PatientReferralForm> createState() => _PatientReferralFormState();
}

class _PatientReferralFormState extends State<PatientReferralForm> {

  final String baseUrl = "http://172.16.87.181:8080";

  final nameController = TextEditingController();
  final diseaseController = TextEditingController();
  final bpController = TextEditingController();
  final oxygenController = TextEditingController();
  final heartController = TextEditingController();
  final treatmentController = TextEditingController();

  bool needsICU = false;
  bool needsVentilator = false;
  bool needsRareMachine = false;
  bool isLoading = false;

  Future<Position?> _getLocationSafe() async {
    try {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (_) {
      return null; // Chrome safe fallback
    }
  }

  Future<void> submitReferral() async {

    if (nameController.text.isEmpty ||
        diseaseController.text.isEmpty) {
      showMessage("Please fill required fields");
      return;
    }

    setState(() => isLoading = true);

    try {

      Position? position = await _getLocationSafe();

      final response = await http.post(
        Uri.parse("$baseUrl/referral/analyze"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "patientName": nameController.text.trim(),
          "disease": diseaseController.text.trim(),
          "bloodPressure": bpController.text.trim(),
          "oxygenLevel": oxygenController.text.trim(),
          "heartRate": heartController.text.trim(),
          "requiredTreatment": treatmentController.text.trim(),
          "needsICU": needsICU,
          "needsVentilator": needsVentilator,
          "needsRareMachine": needsRareMachine,
          "patientLatitude": position?.latitude ?? 0,
          "patientLongitude": position?.longitude ?? 0
        }),
      );

      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AIReferralResultScreen(
              hospitalId: data["recommendedHospitalId"] ?? "N/A",
              reason: data["llmReason"] ?? "No reason provided",
            ),
          ),
        );

      } else {
        showMessage("Server Error: ${response.body}");
      }

    } catch (e) {
      showMessage("Error: $e");
    }

    setState(() => isLoading = false);
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9DA5B5),
      body: Column(
        children: [

          Container(
            height: 190,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, left: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 83, 110, 151),
                  Color.fromARGB(255, 136, 143, 153),
                ],
              ),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(40)),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Patient Referral Form",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [

                  buildInput(nameController, "Patient Name", Icons.person),
                  const SizedBox(height: 15),

                  buildInput(diseaseController, "Disease / Injury", Icons.medical_services),
                  const SizedBox(height: 15),

                  buildInput(bpController, "Blood Pressure", Icons.favorite),
                  const SizedBox(height: 15),

                  buildInput(oxygenController, "Oxygen Level (%)", Icons.air),
                  const SizedBox(height: 15),

                  buildInput(heartController, "Heart Rate (bpm)", Icons.monitor_heart),
                  const SizedBox(height: 15),

                  buildInput(treatmentController, "Required Treatment", Icons.local_hospital),
                  const SizedBox(height: 20),

                  SwitchListTile(
                    value: needsICU,
                    title: const Text("ICU Required?"),
                    onChanged: (val) => setState(() => needsICU = val),
                  ),

                  SwitchListTile(
                    value: needsVentilator,
                    title: const Text("Ventilator Required?"),
                    onChanged: (val) => setState(() => needsVentilator = val),
                  ),

                  SwitchListTile(
                    value: needsRareMachine,
                    title: const Text("Rare Equipment Needed?"),
                    onChanged: (val) => setState(() => needsRareMachine = val),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : submitReferral,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 83, 110, 151),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Check AI Hospitals",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInput(
      TextEditingController controller,
      String hint,
      IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xff536E97)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}