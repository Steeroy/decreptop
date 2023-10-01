// ignore_for_file: avoid_print

import 'dart:io';

import 'package:decreptop/configuration/configuration.dart';
import 'package:decreptop/frontend/components/_components.dart';
import 'package:decreptop/frontend/pages/_pages.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imagePath = "";
  final picker = ImagePicker();
  bool textScanning = false;
  String scannedText = "";
  final _textRecognizer = TextRecognizer();

  List<String> cipher = [
    'b',
    'k',
    'f',
    'l',
    'm',
    'n',
    'o',
    'p',
    'h',
    'q',
    'r',
    's',
    'a',
    'c',
    't',
    'i',
    'u',
    'g',
    'e',
    'j',
    'd',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  List<String> plaintext = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getRecognisedText(String file) async {
    final pictureFile = File(file);
    final inputImage = InputImage.fromFile(pictureFile);
    final recognizedText = await _textRecognizer.processImage(inputImage);

    setState(() {
      scannedText = "";
      for (TextBlock block in recognizedText.blocks) {
        for (TextLine line in block.lines) {
          scannedText += "${line.text}\n";
        }
      }
    });
  }

  String decodeCipher(String cipherText, List<String> cipherMapping,
      List<String> plaintextMapping) {
    String decodedText = "";

    for (int i = 0; i < cipherText.length; i++) {
      String letter = cipherText[i];
      if (cipherMapping.contains(letter)) {
        // Find the index of the letter in the cipher mapping
        int index = plaintextMapping.indexOf(letter);

        // Append the corresponding plaintext letter to the decoded text
        decodedText += cipherMapping[index];
      } else {
        // If the letter is not in the mapping (e.g., spaces or punctuation), keep it as is
        decodedText += letter;
      }
    }
    return decodedText;
  }

  String encodeCipher(String cipherText, List<String> cipherMapping,
      List<String> plaintextMapping) {
    String decodedText = "";

    for (int i = 0; i < cipherText.length; i++) {
      String letter = cipherText[i];
      if (cipherMapping.contains(letter)) {
        // Find the index of the letter in the cipher mapping
        int index = cipherMapping.indexOf(letter);

        // Append the corresponding plaintext letter to the decoded text
        decodedText += plaintextMapping[index];
      } else {
        // If the letter is not in the mapping (e.g., spaces or punctuation), keep it as is
        decodedText += letter;
      }
    }
    return decodedText;
  }

  void decryptMessage() {
    String decodedText =
        decodeCipher(scannedText.toLowerCase(), cipher, plaintext);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          decodedMessage: decodedText,
        ),
      ),
    );
  }

  void encryptMessage() {
    String encodedText =
        encodeCipher(scannedText.toLowerCase(), cipher, plaintext);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          decodedMessage: encodedText,
        ),
      ),
    );
  }

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
              imagePath != ""
                  ? SizedBox(
                      width: double.infinity,
                      height: 268,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? const SizedBox(
                      width: double.infinity,
                      height: 18,
                    )
                  : const SizedBox(),
              BigPrimaryButton(
                text: "Take Picture",
                onPressed: () async {
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.camera);

                  if (pickedFile != null) {
                    setState(() {
                      imagePath = pickedFile.path;
                    });

                    await getRecognisedText(imagePath);
                  }
                },
              ),
              imagePath != ""
                  ? const SizedBox(
                      width: double.infinity,
                      height: 18,
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? BigSecondaryButton(
                      text: "Decrypt Message",
                      onPressed: () {
                        decryptMessage();
                      },
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? const SizedBox(
                      width: double.infinity,
                      height: 18,
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? BigSecondaryButton(
                      text: "Encrypt Message",
                      onPressed: () {
                        encryptMessage();
                      },
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? const SizedBox(
                      width: double.infinity,
                      height: 18,
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? Text(
                      "Scanned Text:",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Configuration().colors.onBackground),
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? const SizedBox(
                      width: double.infinity,
                      height: 18,
                    )
                  : const SizedBox(),
              scannedText != ""
                  ? Text(
                      scannedText,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Configuration().colors.onBackground,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
