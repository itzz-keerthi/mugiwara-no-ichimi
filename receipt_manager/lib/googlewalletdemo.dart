import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AddToGoogleWalletButton(
                pass: _examplePass,
                onError: (Object error) => _onError(context, error),
                onSuccess: () => _onSuccess(context),
                onCanceled: () => _onCanceled(context),
                // Unsupported locale. Button will display English version.
                locale: const Locale('und'),
              ),
              const SizedBox(height: 8.0),
              AddToGoogleWalletButton(
                pass: _examplePass,
                onError: (Object error) => _onError(context, error),
                onSuccess: () => _onSuccess(context),
                onCanceled: () => _onCanceled(context),
                locale: const Locale.fromSubtags(
                  languageCode: 'fr',
                  countryCode: 'FR',
                ),
              ),
              const SizedBox(height: 8.0),
              AddToGoogleWalletButton(
                pass: _examplePass,
                onError: (Object error) => _onError(context, error),
                onSuccess: () => _onSuccess(context),
                onCanceled: () => _onCanceled(context),
              ),
            ],
          ),
        ),
      );

  void _onError(BuildContext context, Object error) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
        ),
      );

  void _onSuccess(BuildContext context) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Pass has been successfully added to the Google Wallet.'),
        ),
      );

  void _onCanceled(BuildContext context) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.yellow,
          content: Text('Adding a pass has been canceled.'),
        ),
      );
}

final String _passId = const Uuid().v4();
const String _passClass = 'ShoppingList';
const String _issuerId = '3388000000022955496';
const String _issuerEmail = 'keerthanaj0229@gmail.com';

final String _examplePass = """
    {
      "iss": "$_issuerEmail",
      "aud": "google",
      "typ": "savetowallet",
      "origins": [],
      "payload": {
        "genericObjects": [
          {
            "id": "$_issuerId.$_passId",
            "classId": "$_issuerId.$_passClass",
            "genericType": "GENERIC_TYPE_UNSPECIFIED",
            "hexBackgroundColor": "#4285f4",
            "logo": {
              "sourceUri": {
                "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/pass_google_logo.jpg"
              }
            },
            "cardTitle": {
              "defaultValue": {
                "language": "en",
                "value": "Agentic AI Hackathon 2025"
              }
            },
            "subheader": {
              "defaultValue": {
                "language": "en",
                "value": "Attendee"
              }
            },
            "header": {
              "defaultValue": {
                "language": "en",
                "value": "Keerthana J"
              }
            },
            "barcode": {
              "type": "QR_CODE",
              "value": "$_passId"
            },
            "heroImage": {
              "sourceUri": {
                "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/google-io-hero-demo-only.jpg"
              }
            },
            "textModulesData": [
              {
                "header": "POINTS",
                "body": "1234",
                "id": "points"
              }
            ]
          }
        ]
      }
    }
""";