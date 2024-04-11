// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';

import 'package:app/presentation/components/sticky_sliver.dart';
import 'package:app/presentation/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool isLoading = false;
  TextEditingController token = TextEditingController();
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController middle_name = TextEditingController();
  TextEditingController address_1 = TextEditingController();
  TextEditingController address_2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController postal_address = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController birth_date = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController national_id_number = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController passport_id = TextEditingController();
  TextEditingController passport_expiration_date = TextEditingController();
  TextEditingController national_id_number_expiration_date =
      TextEditingController();
  GlobalKey formKey = GlobalKey();
  Color secondary = HexColor("#eafefd");

  @override
  void dispose() {
    token.dispose();
    first_name.dispose();
    last_name.dispose();
    middle_name.dispose();
    address_1.dispose();
    address_2.dispose();
    city.dispose();
    email.dispose();
    password.dispose();
    state.dispose();
    postal_address.dispose();
    country.dispose();
    birth_date.dispose();
    phone.dispose();
    national_id_number.dispose();
    nationality.dispose();
    company.dispose();
    passport_expiration_date.dispose();
    national_id_number_expiration_date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: secondary,
      body: SizedBox(
        child: CustomScrollView(
          slivers: [
            StickySliver(
              child: Center(
                child: Container(
                  color: secondary,
                  child: SizedBox(
                    child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign ',
                            style: TextStyle(fontSize: 90, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Up',
                            style: TextStyle(
                                fontSize: 90,
                                color: Color.fromARGB(255, 74, 74, 74)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                    controller: first_name,
                                    decoration: const InputDecoration(
                                      labelText: 'Fist Name',
                                      hintText: 'John',
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
                                    controller: last_name,
                                    decoration: const InputDecoration(
                                      labelText: 'Last Name',
                                      hintText: 'Doe',
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
                                    controller: middle_name,
                                    decoration: const InputDecoration(
                                      labelText: 'Middle Name',
                                      hintText: 'Jane',
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
                                    controller: address_1,
                                    decoration: const InputDecoration(
                                      labelText: 'Address 1',
                                      hintText: 'Lilongwe, Area 18',
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
                                    controller: address_2,
                                    decoration: const InputDecoration(
                                      labelText: 'Address 2',
                                      hintText: 'Lilongwe 3',
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
                                    controller: city,
                                    decoration: const InputDecoration(
                                      labelText: 'City',
                                      hintText: 'Lilongwe',
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
                                    controller: email,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'JohnDoe@gmail.com',
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
                                    controller: state,
                                    decoration: const InputDecoration(
                                      labelText: 'Region',
                                      hintText: 'Central',
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
                                    controller: postal_address,
                                    decoration: const InputDecoration(
                                      labelText: 'Postal Address',
                                      hintText: 'lilongwe 3, 20xxx',
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
                                    controller: country,
                                    decoration: const InputDecoration(
                                      labelText: 'Country',
                                      hintText: 'Malawi',
                                    ),
                                  ),
                                ),
                              ),
                              TextFormField(
                                readOnly: true,
                                controller: birth_date,
                                decoration: const InputDecoration(
                                  labelText: 'Birth Date',
                                  suffixIcon: Icon(Icons.event_note),
                                ),
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(3000),
                                  );
                                  if (newDate == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      final DateFormat formatter =
                                          DateFormat('MM/yyyy');
                                      final String formatted =
                                          formatter.format(newDate);
                                      birth_date.text = formatted;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter a Birth Date';
                                  }
                                  return null;
                                },
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
                                    controller: phone,
                                    decoration: const InputDecoration(
                                      labelText: 'Phone',
                                      hintText: '+265 888 888 888',
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
                                    controller: national_id_number,
                                    decoration: const InputDecoration(
                                      labelText: 'National ID Number',
                                      hintText: 'WXXXXXXX',
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
                                    controller: nationality,
                                    decoration: const InputDecoration(
                                      labelText: 'Nationality',
                                      hintText: 'Malawian',
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
                                    controller: company,
                                    decoration: const InputDecoration(
                                      labelText: 'Company',
                                      hintText: 'JohnDoe Co.',
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
                                    controller: passport_id,
                                    decoration: const InputDecoration(
                                      labelText: 'Passport Id',
                                      hintText: 'xxx xxxxx',
                                    ),
                                  ),
                                ),
                              ),
                              TextFormField(
                                readOnly: true,
                                controller: passport_expiration_date,
                                decoration: const InputDecoration(
                                  labelText: 'Passport Expiration Date',
                                  suffixIcon: Icon(Icons.event_note),
                                ),
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(3000),
                                  );
                                  if (newDate == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      final DateFormat formatter =
                                          DateFormat('MM/yyyy');
                                      final String formatted =
                                          formatter.format(newDate);
                                      passport_expiration_date.text = formatted;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter a passport Expiration Date';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                readOnly: true,
                                controller: national_id_number_expiration_date,
                                decoration: const InputDecoration(
                                  labelText: 'National Id Expiration Date',
                                  suffixIcon: Icon(Icons.event_note),
                                ),
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(3000),
                                  );
                                  if (newDate == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      final DateFormat formatter =
                                          DateFormat('MM/yyyy');
                                      final String formatted =
                                          formatter.format(newDate);
                                      national_id_number_expiration_date.text =
                                          formatted;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Id Expiration Date';
                                  }
                                  return null;
                                },
                              ),
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
                                onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => const Login(),
                                )),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 74, 74, 74)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          child: InkWell(
                            onTap: () async {
                              register();
                            },
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.black,
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 150,
              )
            ]))
          ],
        ),
      ),
    );
  }

  Future register() async {
    String baseUrl = "http://192.168.1.187:8000/api/v1/user/register";
    // print(baseUrl);
    var response = await http.post(Uri.parse(baseUrl),
        body: ({
          "token": token.text,
          "first_name": first_name.text,
          "last_name": last_name.text,
          "middle_name": middle_name.text,
          "address_1": address_1.text,
          "address_2": address_2.text,
          "city": city.text,
          "email": email.text,
          "password": password.text,
          "state": state.text,
          "postal_address": postal_address.text,
          "country": country.text,
          "birth_date": birth_date.text,
          "phone": phone.text,
          "national_id_number": national_id_number.text,
          "nationality": nationality.text,
          "company": company.text,
          "passport_expiration_date": passport_expiration_date.text,
          "national_id_number_expiration_date":
              national_id_number_expiration_date.text
        }),
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

      // Todo: Handle Server Errors
      await Future.delayed(const Duration(seconds: 1));
      pageRoute();
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
  }

  void pageRoute() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }
}
