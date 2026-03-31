import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/google_fonts_compat.dart';

class FeaturesOnProgress extends StatelessWidget {
  const FeaturesOnProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 70,
              child: ClipOval(
                child:
                    Lottie.asset('images/lottie/maintenance.json', width: 150),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Fitur dalam pengembangan",
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                fontSize: 24.0,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF006769),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Fitur ini masih dalam tahap pengembangan, silakan kembali lagi di lain waktu.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromARGB(255, 206, 253, 207),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                "Shap Bang!",
                style: GoogleFonts.quicksand(
                  color: const Color(0xFF006769),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
