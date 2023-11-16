// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:app/presentation/pages/authentication/registration.dart';
import 'package:app/presentation/pages/navigatior/index.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color primary = HexColor("#b4eef0");

    return Scaffold(
      backgroundColor: primary,
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign ',
                        style: TextStyle(fontSize: 90, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'In',
                        style: TextStyle(
                            fontSize: 90,
                            color: Color.fromARGB(255, 74, 74, 74)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field Required';
                          }
                          return null;
                        },
                        controller: emailId,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'xxxx@email.com',
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field Required';
                          }
                          return null;
                        },
                        controller: password,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'xxxxxx',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Registration(),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 74, 74, 74),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              child: InkWell(
                onTap: (() async {
                  login();
                }),
                child: Container(
                  width: 300,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void pageRoute(String token, String name, String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token", token);
    await pref.setString("full_name", name);
    await pref.setString("email", email);
    await pref.setString("password", password.text);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NavigationBarRouterTab(),
      ),
    );
  }

  Future login() async {
    if (password.text.isNotEmpty && emailId.text.isNotEmpty) {
      String baseUrl = "http://172.20.10.4:8000/api/v1/user/login";
      // print(baseUrl);
      var response = await http.post(Uri.parse(baseUrl),
          body: ({'email': emailId.text, 'password': password.text}),
          headers: {
            "Accept": "application/json",
          });
      final body = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var message = body["message"];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$message"),
          ),
        );
        setState(() {
          isLoading = false;
        });
        await Future.delayed(const Duration(seconds: 1));
        pageRoute(body["token"], body["name"], body["email"]);
      } else if (response.statusCode >= 400 && response.statusCode <= 499) {
        var message = body["message"];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$message"),
          ),
        );
        setState(() {
          isLoading = false;
        });
      } else if (response.statusCode >= 500 && response.statusCode <= 599) {
        var message = body["message"];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$message"),
          ),
        );
        setState(() {
          isLoading = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Blank Fields are Not Allowed"),
        ),
      );
    }
    await Future.delayed(Duration(seconds: 20));
    setState(() => isLoading = false);
  }
}
