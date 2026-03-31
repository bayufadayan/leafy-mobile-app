import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/google_fonts_compat.dart';

class CustomDialog extends StatefulWidget {
  final String title, description, buttonText;
  final Image image;

  const CustomDialog({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.image,
  });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  late final StreamSubscription<List<ConnectivityResult>>? subscription;

  bool isInternetConnected = true;

  @override
  void initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      bool isConnected = await InternetConnectionChecker.instance.hasConnection;

      if (mounted) {
        setState(() {
          isInternetConnected = isConnected;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

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
              radius: 50,
              child: ClipOval(
                child: widget.image,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFE4361E),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
                onPressed: () {
                  if (isInternetConnected) {
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(
                      FontAwesomeIcons.arrowRotateLeft,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.buttonText,
                      style: GoogleFonts.quicksand(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
