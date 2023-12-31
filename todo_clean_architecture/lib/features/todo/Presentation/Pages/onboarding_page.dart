import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Domain/entities/task.dart';
import 'home_page.dart';


List<Tasks>? tasks;

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text("Todo app",
                    style: GoogleFonts.justMeAgainDownHere(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(36, 47, 101, 1),
                        decoration: TextDecoration.none))),
            const SizedBox(height: 25),
            const Image(
                image: AssetImage("assets/image_assets/onboarding.jpg")),
            const SizedBox(height: 75),
            SizedBox(
              width: 300,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TaskListScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3FAEE5),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
                child: const Text(
                  "GET STARTED",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
    );
  }
}
