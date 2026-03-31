import 'package:flutter/material.dart';
import '../utils/google_fonts_compat.dart';

class MyStatsCard extends StatelessWidget {
  final String metricTitle;
  final String sensorName;
  final Color colorTitle;
  final String statsIllustration;

  // Constructor
  const MyStatsCard({
    super.key,
    required this.metricTitle,
    required this.sensorName,
    required this.colorTitle,
    required this.statsIllustration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Statistik $metricTitle',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w800,
                      fontSize: 20.0,
                      color: colorTitle,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                      "Lihat statistik pengukuran dari $sensorName")
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Flexible(
              flex: 1,
              child: Image.asset(
                statsIllustration,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
