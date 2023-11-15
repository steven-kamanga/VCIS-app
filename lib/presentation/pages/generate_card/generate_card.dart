import 'dart:math';
import 'package:app/presentation/components/sticky_sliver.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validators/validators.dart';

class GenerateCard extends StatefulWidget {
  const GenerateCard({super.key});

  @override
  State<GenerateCard> createState() => _GenerateCardState();
}

class _GenerateCardState extends State<GenerateCard> {
  List<String> instrumentTypeList = [
    "Credit Card",
    "Debit Card",
  ];

  TextEditingController cardNumber = TextEditingController();
  TextEditingController lastFour = TextEditingController();
  TextEditingController expiration = TextEditingController();
  TextEditingController chipCvvNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController instrumentType = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int currentStep = 0;

  String formatCardNumber(String cardNumber) {
    var buffer = StringBuffer();
    for (int i = 0; i < cardNumber.length; i++) {
      buffer.write(cardNumber[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != cardNumber.length) {
        buffer.write(' '); // Add double spaces.
      }
    }
    return buffer.toString();
  }

  int cardx = 0;

  @override
  void initState() {
    String cardNumberString = generateVisaCardNumber();
    cardNumber.text = formatCardNumber(cardNumberString);
    String cardNumberNoSpaces = cardNumber.text.replaceAll(' ', '');
    cardx = int.parse(cardNumberNoSpaces);
    lastFourDigits(cardNumberNoSpaces);
    chipCvvNumber.text = generateCvvNumber();
    super.initState();
  }

  String lastFourDigits(String cardNumberNoSpaces) {
    String lsf;
    String lastFourString =
        cardNumberNoSpaces.substring(cardNumberNoSpaces.length - 4);
    lastFour.text = int.parse(lastFourString).toString();
    lsf = lastFour.text;
    return lsf;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                const Text(
                  "Create Your",
                  style: TextStyle(fontSize: 60, color: Colors.black),
                ),
              ])),
              StickySliver(
                child: Container(
                  color: Colors.white,
                  child: const Text(
                    "Card",
                    style: TextStyle(fontSize: 60, color: Colors.black),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    TextFormField(
                                      readOnly: true,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Field Required';
                                        }
                                        return null;
                                      },
                                      controller: cardNumber,
                                      decoration: const InputDecoration(
                                        labelText: 'Card Number',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 18,
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                reGenerateCard();
                                              });
                                            },
                                            icon: const Icon(Icons.repeat),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  readOnly: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  controller: lastFour,
                                  decoration: const InputDecoration(
                                    labelText: 'Last Four',
                                    border: InputBorder.none,
                                  ),
                                ),
                                TextFormField(
                                  readOnly: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  controller: chipCvvNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'CVV',
                                    border: InputBorder.none,
                                  ),
                                ),
                                TextFormField(
                                  readOnly: true,
                                  controller: expiration,
                                  decoration: const InputDecoration(
                                    labelText: 'Expiration',
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
                                            DateFormat('MM/yy');
                                        final String formatted =
                                            formatter.format(newDate);
                                        expiration.text = formatted;
                                      });
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Expiration Date';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    } else if (!isAlpha(value)) {
                                      return "Invalid City";
                                    }
                                    return null;
                                  },
                                  controller: city,
                                  decoration:
                                      const InputDecoration(labelText: 'City'),
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
                                      controller: instrumentType,
                                      labelText: 'Title',
                                      labelStyle: const TextStyle(
                                          fontWeight: FontWeight.normal),
                                      enabled: true,
                                      items: instrumentTypeList,
                                      itemsVisibleInDropdown: 2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
          ),
        ),
      ),
    );
  }

  void reGenerateCard() {
    String newCardNumber = generateVisaCardNumber();
    cardNumber.text = formatCardNumber(newCardNumber);
    String cardNumberNoSpaces = cardNumber.text.replaceAll(' ', '');
    lastFourDigits(cardNumberNoSpaces);
    String newCvv = generateCvvNumber();
    chipCvvNumber.text = newCvv;
  }

  String generateVisaCardNumber() {
    var rng = Random();
    int length = 16;
    StringBuffer card;
    String cardNumber;

    do {
      card = StringBuffer();
      card.write('4');

      for (var i = 0; i < length - 1; i++) {
        card.write(rng.nextInt(10));
      }

      cardNumber = card.toString();
    } while (!luhnCheck(cardNumber));

    return cardNumber;
  }

  bool luhnCheck(String cardNumber) {
    var sum = 0;
    for (var i = cardNumber.length - 1; i >= 0; i -= 2) {
      sum += int.parse(cardNumber[i]);
    }
    for (var i = cardNumber.length - 2; i >= 0; i -= 2) {
      var digit = int.parse(cardNumber[i]) * 2;
      if (digit > 9) {
        digit -= 9;
      }
      sum += digit;
    }
    return sum % 10 == 0;
  }

  String generateCvvNumber() {
    var rng = Random();
    int cvv = rng.nextInt(1000);
    return cvv.toString().padLeft(3, '0');
  }
}


// Todo: Choose card type [credit card (JIT Funding), Debit Card (GPA Funding)]
// Todo: Generate Card Number using random generation algorithm
// Todo: Set Constraints, expirations, merchants, e.t.c.
// Todo: Send info to server