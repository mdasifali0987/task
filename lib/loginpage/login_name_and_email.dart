import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/widget/assistant_method.dart';

class LogInWithNameEmail extends StatefulWidget {
  const LogInWithNameEmail({Key? key}) : super(key: key);

  @override
  State<LogInWithNameEmail> createState() => _LogInWithNameEmailState();
}

class _LogInWithNameEmailState extends State<LogInWithNameEmail> {
  final name = TextEditingController();
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 133,
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
                    "Welcome",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent.shade700,
                        fontSize: 22),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Look like you are new here Tell us a bit about yourself!",
                    style: TextStyle(
                        color: Colors.orangeAccent.shade700, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50),
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(),
                      hintText: "Name",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: Icon(Icons.person, size: 22),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "name can't be empty";
                      }
                      if (text.length < 2) {
                        return "please enter a valid name";
                      }
                      if (text.length > 49) {
                        return "name can't be more than 50";
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        name.text = text;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50),
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      hintText: "Email",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: Icon(
                          Icons.email,
                          size: 22,
                        ),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Email can't be empty";
                      }
                      if (EmailValidator.validate(text) == true) {
                        return null;
                      }
                      if (text.length < 2) {
                        return "please enter a valid Email";
                      }
                      if (text.length > 49) {
                        return "Email can't be more than 100";
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        email.text = text;
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
                        style: const ButtonStyle(elevation: MaterialStatePropertyAll(8)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AssistantMethod.logInWithNameAndEmail(context, name.text, email.text);
                            }
                          },
                          child: const Text("Submit",style: TextStyle(fontSize: 16),))),
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
