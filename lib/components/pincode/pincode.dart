import 'dart:async';
import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:splashtest/contacts.dart';

class PinCodePage extends StatefulWidget {
  final String storedPasscode;
  PinCodePage({Key? key, required this.storedPasscode}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PinCode();
}

class PinCode extends State<PinCodePage> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;
  bool playSound = false;

  @override
  Widget build(BuildContext context) {
    if (isAuthenticated) {
      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContactsPage()),
        );
      });
    }
    if (playSound) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ContactsPage()),
      // );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter PIN Code To Continue'),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: PasscodeScreen(
                  title: Text(
                    'PIN Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 28),
                  ),
                  circleUIConfig: CircleUIConfig(
                      borderColor: Colors.blue,
                      fillColor: Colors.blue,
                      circleSize: 30),
                  keyboardUIConfig: KeyboardUIConfig(
                      digitTextStyle:
                          TextStyle(color: Colors.black, fontSize: 30),
                      digitBorderWidth: 2,
                      primaryColor: Colors.blue),
                  passwordEnteredCallback: _onPasscodeEntered,
                  cancelButton: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  deleteButton: Text(
                    'Delete',
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
                    semanticsLabel: 'Delete',
                  ),
                  shouldTriggerVerification: _verificationNotifier.stream,
                  backgroundColor: Colors.white,
                  digits: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
                  passwordDigits: 4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = super.widget.storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(
        () {
          this.playSound = false;
          this.isAuthenticated = true;
        },
      );
    } else {
      setState(
        () {
          this.playSound = true;
          this.isAuthenticated = false;
        },
      );
    }
  }
}
