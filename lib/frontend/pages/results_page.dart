import 'package:flutter/material.dart';

import '../../configuration/configuration.dart';

class ResultsPage extends StatefulWidget {
  final String decodedMessage;

  const ResultsPage({super.key, required this.decodedMessage});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Configuration().colors.background,
      appBar: AppBar(
        backgroundColor: Configuration().colors.background,
        toolbarHeight: 68,
        elevation: 0,
        title: Center(
          child: Text(
            "Decrypto",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Configuration().colors.primary,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Decrypted Text:",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Configuration().colors.onBackground),
              ),
              const SizedBox(
                width: double.infinity,
                height: 18,
              ),
              Text(
                widget.decodedMessage,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Configuration().colors.onBackground,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
