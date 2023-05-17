import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../home_page.dart';
import '../loginpage/login_name_and_email.dart';
import '../loginpage/otp_verify.dart';

class AssistantMethod {
  static Future submit(
    BuildContext context,
    String phoneNumber,
  ) async {
    const uri = "https://test-otp-api.7474224.xyz/sendotp.php";
    final response = await http.get(Uri.parse(uri));
    try {
      if (response.statusCode == 200) {
        String responseData = response.body;
        //var data = jsonDecode(responseData);
        //print(">>>>>>>>>>>>>>>>>>>>$data");
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => OtpVerifyScreen(phoneNumber)));
      } else {
        return "error failed no response ";
      }
    } catch (e) {
      return "error failed no response ";
    }
  }

  static Future verify(
      BuildContext context, String phone, String phoneCode) async {
    const uri = 'https://test-otp-api.7474224.xyz/verifyotp.php';
    final response = await http.post(
      Uri.parse(uri),
      body:
          jsonEncode(<String, String>{"request_id": phone, "code": phoneCode}),
    );

    if (response.statusCode == 200) {
      String responseData = response.body;
      var data = jsonDecode(responseData);
      var status = data["status"];
      print(">>>>>>>>>>>>>>>>>>>>$data");
      if (status == true) {
        await Fluttertoast.showToast(msg: "Successfully");
         Navigator.push(
            context, MaterialPageRoute(builder: (_) => LogInWithNameEmail()));
      } else {
        await Fluttertoast.showToast(msg: "Invalid OTP");
      }
    } else {
      throw Exception('>>>>>>>>>>>>>>Failed');
    }
  }

  static Future logInWithNameAndEmail(
    BuildContext context,
    String name,
    String email,
  ) async {
    const uri = 'https://test-otp-api.7474224.xyz/profilesubmit.php';
    final response = await http.post(
      Uri.parse(uri),
      headers: <String, String>{
        'Headers': '',
        'Token': 'jwt1235',
      },
    );

    if (response.statusCode == 200) {
      String responseData = response.body;
      var data = jsonDecode(responseData);
      print(">>>>>>>>>>>>>>>>>>>>$data");
      await Fluttertoast.showToast(msg: "Successfully Logged In");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen(name, email)),
          (Route<dynamic> route) => false);
    } else {
      throw Exception('>>>>>>>>>>>>>>Failed');
    }
  }
}
