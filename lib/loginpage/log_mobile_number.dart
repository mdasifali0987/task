import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../widget/assistant_method.dart';

class LogInMobileNo extends StatefulWidget {
  const LogInMobileNo({Key? key}) : super(key: key);

  @override
  State<LogInMobileNo> createState() => _LogInMobileNoState();
}

class _LogInMobileNoState extends State<LogInMobileNo> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 33.0, right: 33),
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
                    "Lets start",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent.shade700,
                        fontSize: 22),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  IntlPhoneField(
                    showCountryFlag: false,
                    dropdownIcon: const Icon(
                      Icons.arrow_drop_down,
                      size: 0,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      hintText: "Phone",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    initialCountryCode: "IN",
                    onChanged: (text) {
                      setState(() {
                        phoneController.text = text.completeNumber;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 77,
                  ),
                  SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(8),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AssistantMethod.submit(context, phoneController.text);
                            }
                          },
                          child: const Text(
                            "Continue",
                            style: TextStyle(fontSize: 16),
                          ))),
                  const SizedBox(
                    height: 33,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
