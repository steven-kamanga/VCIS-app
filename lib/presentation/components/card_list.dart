// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardList extends StatefulWidget {
  CardList({
    super.key,
    required this.cardNumber,
    required this.cvvNumber,
    required this.expiration,
    required this.lastFour,
  });

  String cardNumber;
  String lastFour;
  String expiration;
  String cvvNumber;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CreditCard(
      size: size,
      cardNumber: widget.cardNumber,
      lastFour: widget.lastFour,
      expiration: widget.expiration,
      cvvNumber: widget.cvvNumber,
    );
  }
}

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.size,
    required this.cardNumber,
    required this.lastFour,
    required this.expiration,
    required this.cvvNumber,
  }) : super(key: key);

  final Size size;
  final String cardNumber;
  final String lastFour;
  final String expiration;
  final String cvvNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 210,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.card_giftcard,
                        size: 40,
                        color: Colors.white,
                      ),
                      Text(
                        "**** **** **** $lastFour",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expires $expiration",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 166, 166, 166)),
                    ),
                    Text(
                      "Steven Kamanga",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
