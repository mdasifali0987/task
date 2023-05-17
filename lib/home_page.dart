import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String? name;
  String? email;

  HomeScreen(this.name, this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Row(
          children: [
            const Text("Hey User!"),
            Text(" $name",
                style: TextStyle(
                    color: Colors.orangeAccent.shade700,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 99,
                ),
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                        child: Center(
                            child: Text("$name",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.orangeAccent.shade700))))),
                const SizedBox(
                  height: 22,
                ),
                Text("$email",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.orangeAccent.shade700)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
