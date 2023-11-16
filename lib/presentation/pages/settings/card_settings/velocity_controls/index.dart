// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors
import 'package:group_radio_button/group_radio_button.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:app/models/associations.dart';
import 'package:app/models/card.dart';
import 'package:app/models/merchant.dart';
import 'package:app/providers/associations.dart';
import 'package:app/providers/card_provide.dart';
import 'package:app/providers/merchantProvider.dart';
import 'package:http/http.dart' as http;
import 'package:app/presentation/components/sticky_sliver.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VelocityControl extends ConsumerStatefulWidget {
  const VelocityControl({Key? key}) : super(key: key);

  @override
  ConsumerState<VelocityControl> createState() => _AssociationsState();
}

class _AssociationsState extends ConsumerState<VelocityControl> {
  String token = '';

  Future<String> getCredentials() async {
    String token = '';
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token")!;
    return token;
  }

  void setToken() async {
    token = await getCredentials();
  }

  AssociationModel? selectedAssiciation;
  MerchantModel? selectedMerchant;
  CardModel? selectedCard;

  bool isLoading = false;

  List<String> currencyList = ["MWK"];
  int selectedValue8 = 0,
      selectedValue7 = 0,
      selectedValue6 = 0,
      selectedValue5 = 0,
      selectedValue14 = 0,
      selectedValue12 = 1;

  TextEditingController includeCredits = TextEditingController();
  TextEditingController approvals_only = TextEditingController();
  TextEditingController include_purchases = TextEditingController();
  TextEditingController include_withdrawals = TextEditingController();
  TextEditingController include_transfers = TextEditingController();
  TextEditingController include_cashback = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController association_token = TextEditingController();
  TextEditingController merchant_scope = TextEditingController();
  TextEditingController usage_limit = TextEditingController();
  TextEditingController amount_limit = TextEditingController();
  TextEditingController currency_code = TextEditingController();
  TextEditingController card_id = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setToken();

    includeCredits.text = "False";
    include_cashback.text = "False";
    include_purchases.text = "False";
    include_transfers.text = "False";
    include_withdrawals.text = "False";
    approvals_only.text = "False";

    super.initState();
  }

  Color secondary = HexColor("#eafefd");

  @override
  Widget build(BuildContext context) {
    final assocAsyncValue = ref.watch(associationProvider);
    final mercAsyncValue = ref.watch(merchantProvider);
    final cardAsyncValue = ref.watch(cardProvider);

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
          child: assocAsyncValue.when(
            data: (assoc) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    const Text(
                      "Velocity Controls for",
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ])),
                  StickySliver(
                    child: Container(
                      color: secondary,
                      child: const Text(
                        "Your Card",
                        style: TextStyle(
                            fontSize: 40,
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
                                      const Text("Association"),
                                      DropdownButton<AssociationModel>(
                                        isExpanded: true,
                                        value: selectedAssiciation,
                                        items: assoc.map<
                                            DropdownMenuItem<AssociationModel>>(
                                          (AssociationModel association) {
                                            return DropdownMenuItem<
                                                AssociationModel>(
                                              value: association,
                                              child: Text(association.token!),
                                            );
                                          },
                                        ).toList(),
                                        onChanged:
                                            (AssociationModel? newValue) {
                                          setState(() {
                                            selectedAssiciation = newValue;
                                            association_token.text =
                                                newValue!.id.toString();
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                mercAsyncValue.when(data: (merc) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Merchant"),
                                        DropdownButton<MerchantModel>(
                                          isExpanded: true,
                                          value: selectedMerchant,
                                          items: merc.map<
                                              DropdownMenuItem<MerchantModel>>(
                                            (MerchantModel merchant) {
                                              return DropdownMenuItem<
                                                  MerchantModel>(
                                                value: merchant,
                                                child: Text(merchant.name),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (MerchantModel? newValue) {
                                            setState(() {
                                              selectedMerchant = newValue;
                                              merchant_scope.text =
                                                  newValue!.id.toString();
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }, error:
                                    (Object error, StackTrace stackTrace) {
                                  return Text(e.toString());
                                }, loading: () {
                                  return const CircularProgressIndicator();
                                }),
                                cardAsyncValue.when(data: (cards) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
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
                                            card_id.text =
                                                newValue!.id.toString();
                                          });
                                        },
                                      )
                                    ],
                                  );
                                }, error:
                                    (Object error, StackTrace stackTrace) {
                                  return Text(e.toString());
                                }, loading: () {
                                  return const CircularProgressIndicator();
                                }),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  controller: name,
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                    hintText: 'Monthy control',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  controller: usage_limit,
                                  decoration: const InputDecoration(
                                    labelText: 'Usage Limit (MWK)',
                                    hintText: '20000',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  controller: amount_limit,
                                  decoration: const InputDecoration(
                                    labelText: 'Amount Limit (MWK)',
                                    hintText: '20000',
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
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Include Credit?"),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding:
                                                EdgeInsets.only(left: 40),
                                            activeColor: Colors.black,
                                            value: 0,
                                            title: Text("Yes"),
                                            groupValue: selectedValue12,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue12 =
                                                        value as int;
                                                    if (value == 0) {
                                                      setState(() {
                                                        includeCredits.text =
                                                            "True";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text("No"),
                                            activeColor: Colors.black,
                                            value: 1,
                                            groupValue: selectedValue12,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue12 =
                                                        value as int;
                                                    if (value == 1) {
                                                      setState(() {
                                                        includeCredits.text =
                                                            "False";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Text("Approvals Only?"),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding:
                                                EdgeInsets.only(left: 40),
                                            activeColor: Colors.black,
                                            value: 0,
                                            title: Text("Yes"),
                                            groupValue: selectedValue14,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue14 =
                                                        value as int;
                                                    if (value == 0) {
                                                      setState(() {
                                                        approvals_only.text =
                                                            "True";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text("No"),
                                            activeColor: Colors.black,
                                            value: 1,
                                            groupValue: selectedValue14,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue14 =
                                                        value as int;
                                                    if (value == 1) {
                                                      setState(() {
                                                        approvals_only.text =
                                                            "False";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Text("Include Purchases"),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding:
                                                EdgeInsets.only(left: 40),
                                            activeColor: Colors.black,
                                            value: 0,
                                            title: Text("Yes"),
                                            groupValue: selectedValue8,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue8 =
                                                        value as int;
                                                    if (value == 0) {
                                                      setState(() {
                                                        include_purchases.text =
                                                            "True";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text("No"),
                                            activeColor: Colors.black,
                                            value: 1,
                                            groupValue: selectedValue8,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue8 =
                                                        value as int;
                                                    if (value == 1) {
                                                      setState(() {
                                                        include_purchases.text =
                                                            "False";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Text("Include Withdrawals"),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding:
                                                EdgeInsets.only(left: 40),
                                            activeColor: Colors.black,
                                            value: 0,
                                            title: Text("Yes"),
                                            groupValue: selectedValue7,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue7 =
                                                        value as int;
                                                    if (value == 0) {
                                                      setState(() {
                                                        include_withdrawals
                                                            .text = "True";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text("No"),
                                            activeColor: Colors.black,
                                            value: 1,
                                            groupValue: selectedValue7,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue7 =
                                                        value as int;
                                                    if (value == 1) {
                                                      setState(() {
                                                        include_withdrawals
                                                            .text = "False";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Text("Include Transfers"),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding:
                                                EdgeInsets.only(left: 40),
                                            activeColor: Colors.black,
                                            value: 0,
                                            title: Text("Yes"),
                                            groupValue: selectedValue6,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue6 =
                                                        value as int;
                                                    if (value == 0) {
                                                      setState(() {
                                                        include_transfers.text =
                                                            "True";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text("No"),
                                            activeColor: Colors.black,
                                            value: 1,
                                            groupValue: selectedValue6,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue6 =
                                                        value as int;
                                                    if (value == 1) {
                                                      setState(() {
                                                        include_transfers.text =
                                                            "False";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Text("Include Cashbacks"),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding:
                                                EdgeInsets.only(left: 40),
                                            activeColor: Colors.black,
                                            value: 0,
                                            title: Text("Yes"),
                                            groupValue: selectedValue5,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue5 =
                                                        value as int;
                                                    if (value == 0) {
                                                      setState(() {
                                                        include_cashback.text =
                                                            "True";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text("No"),
                                            activeColor: Colors.black,
                                            value: 1,
                                            groupValue: selectedValue5,
                                            onChanged: ((value) => setState(
                                                  () {
                                                    selectedValue5 =
                                                        value as int;
                                                    if (value == 1) {
                                                      setState(() {
                                                        include_cashback.text =
                                                            "False";
                                                      });
                                                    }
                                                  },
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
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
    String baseUrl = "http://172.20.10.4:8000/api/v1/card/velocity-control";
    var response = await http.post(
      Uri.parse(baseUrl),
      body: ({
        "name": name.text,
        "association": association_token.text,
        "usage_limit": usage_limit.text,
        "amount_limit": amount_limit.text,
        "currency_code": currency_code.text,
        "merchant_scope": merchant_scope.text,
        "card_id": card_id.text,
        "approvals_only": approvals_only.text,
        "include_purchases": include_cashback.text,
        "include_withdrawals": include_purchases.text,
        "include_transfers": include_transfers.text,
        "include_cashback": include_withdrawals.text,
        "include_credits": includeCredits.text,
      }),
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: token
      },
    );
    final body = json.decode(response.body);
    // print(response.body);
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