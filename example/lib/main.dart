import 'package:flutter/material.dart';
import 'package:numpad/numpad.dart';

void main() {
  runApp(const PasscodeScreen());
}

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({Key? key}) : super(key: key);

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  String code = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text("Enter Passcode"),
                NumPad(
                  onTap: (val) {
                    if (val == 99) {
                      if (code.isNotEmpty) {
                        setState(() {
                          code = code.substring(0, code.length - 1);
                        });
                      }
                    } else {
                      setState(() {
                        code += "$val";
                      });
                    }
                    print(code);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
