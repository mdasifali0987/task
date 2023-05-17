import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/widget/assistant_method.dart';

import 'log_mobile_number.dart';

class OtpVerifyScreen extends StatelessWidget {
  String? phone;
  OtpVerifyScreen(this.phone, {Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? phoneCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LogInMobileNo()),
                          (Route<dynamic> route) => false);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.orangeAccent.shade700,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/logo.png"),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Enter OTP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent.shade700,
                        fontSize: 22),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Text(
                        "OTP has been sent to",
                        style: TextStyle(
                          color: Colors.orangeAccent.shade700,
                        ),
                      ),
                      Text(
                        " $phone",
                        style: const TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: OtpTextField(
                      borderColor: Colors.orangeAccent.shade700,
                      numberOfFields: 6,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                        phoneCode = code;
                        //print(">>>>>>>>>>>>::::::::::::${phoneCode}");
                      },
                      onSubmit: (String cod) {
                        phoneCode = cod;
                      }, // end onSubmit
                    ),
                  ),
                  const SizedBox(
                    height: 66,
                  ),
                  SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(8),
                          ),
                          onPressed: () async {
                            if (phoneCode == null) {
                              await Fluttertoast.showToast(
                                  msg: "please enter the otp number");
                            } else {
                              AssistantMethod.verify(
                                  context, phone!, phoneCode!);
                            }
                          },
                          child: const Text("verify otp",style: TextStyle(fontSize: 16)))),
                  const SizedBox(height: 33,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

///0987654321
