// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardBack extends StatefulWidget {
  CardBack({
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
  State<CardBack> createState() => _CardBackState();
}

class _CardBackState extends State<CardBack> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: SizedBox(
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 15,
                        width: 340,
                        color: Colors.white,
                      ),
                      Text(
                        cvvNumber,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
