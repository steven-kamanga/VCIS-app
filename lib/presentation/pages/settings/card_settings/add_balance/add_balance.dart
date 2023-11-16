// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:app/presentation/components/sticky_sliver.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../models/card.dart';
import '../../../../../providers/card_provide.dart';

class AddBalance extends ConsumerStatefulWidget {
  const AddBalance({Key? key}) : super(key: key);

  @override
  ConsumerState<AddBalance> createState() => _AddBalanceState();
}

class _AddBalanceState extends ConsumerState<AddBalance> {
  String token = '';
  Future<String> getCredentials() async {
    String token = '';
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token")!;
    return token;
  }

  void setToken() async {
    token = await getCredentials();
    print(token);
  }

  CardModel? selectedCard;

  bool isLoading = false;

  List<String> cards = [
    "**** **** **** 3342",
    "**** **** **** 5436",
  ];

  List<String> currencyList = [
    "MWK",
    "ZAR",
    "USD",
    "EUR",
  ];

  TextEditingController amount = TextEditingController();
  TextEditingController currency_code = TextEditingController();
  TextEditingController card = TextEditingController();
  TextEditingController funding_source_token = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setToken();
    super.initState();
  }

  Color secondary = HexColor("#eafefd");

  @override
  Widget build(BuildContext context) {
    final cardsAsyncValue = ref.watch(cardProvider);
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: secondary,
          ),
          child: cardsAsyncValue.when(
            data: (cards) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    const Text(
                      "Fund Your",
                      style: TextStyle(fontSize: 60, color: Colors.black),
                    ),
                  ])),
                  StickySliver(
                    child: Container(
                      color: secondary,
                      child: const Text(
                        "Card",
                        style: TextStyle(
                            fontSize: 60,
                            color: Color.fromARGB(255, 112, 112, 112)),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          color: Colors.transparent,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Select a Card"),
                                      DropdownButton<CardModel>(
                                        isExpanded: true,
                                        value: selectedCard,
                                        items: cards
                                            .map<DropdownMenuItem<CardModel>>(
                                          (CardModel card) {
                                            return DropdownMenuItem<CardModel>(
                                              value: card,
                                              child:
                                                  Text(card.cardProductToken!),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (CardModel? newValue) {
                                          setState(() {
                                            selectedCard = newValue;
                                            card.text = newValue!.id.toString();
                                            print(card.text);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  controller: amount,
                                  decoration: const InputDecoration(
                                    labelText: 'Amount',
                                    hintText: '2,000.00',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  children: [
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: Text(
                                            "*",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                    DropDownField(
                                      strict: true,
                                      required: true,
                                      controller: currency_code,
                                      labelText: 'Currency Code',
                                      labelStyle: const TextStyle(
                                          fontWeight: FontWeight.normal),
                                      enabled: true,
                                      items: currencyList,
                                      itemsVisibleInDropdown: 4,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      post();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: const Center(
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 23),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const SizedBox(
                          height: 110,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
          ),
        ),
      ),
    );
  }

  Future post() async {
    String baseUrl = "http://172.20.10.4:8000/api/v1/card/funding";
    print(amount.text);
    print(card.text);
    print(currency_code.text);

    var response = await http.post(
      Uri.parse(baseUrl),
      body: ({
        "amount": amount.text,
        "currency_code": currency_code.text,
        "card": card.text,
      }),
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "$token"
      },
    );
    final body = json.decode(response.body);
    print(response.body);
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
}

// Todo: Choose card type [credit card (JIT Funding), Debit Card (GPA Funding)]
// Todo: Generate Card Number using random generation algorithm
// Todo: Set Constraints, expirations, merchants, e.t.c.
// Todo: Send info to server
// Todo: Choose funding method
// Todo: Scaffold widget vertical to add balance to api
// Todo: Verify Payment method
// Todo: Send Balance to api route