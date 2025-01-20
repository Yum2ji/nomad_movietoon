import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  final String homepagelink;

  const Episode({
    super.key,
    required this.homepagelink,
  });

    onButtonTap() async {
     try{
      await launchUrlString(homepagelink);
     }
     catch (e) {
      print("Error occurred: $e");
      }
    }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onButtonTap,
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Buy ticket",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
