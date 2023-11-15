import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardList extends StatefulWidget {
  CardList(
      {super.key,
      required this.cardNumber,
      required this.color,
      required this.textColor});

  int cardNumber;
  Color color;
  Color textColor;

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
      color: widget.color,
      textColor: widget.textColor,
    );
  }
}

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.size,
    required this.cardNumber,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final Size size;
  final int cardNumber;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: size.height * 0.32,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Column(
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
                        "**** 4141",
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
                      "Expires 04/25",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 166, 166, 166)),
                    ),
                    Text(
                      "Steven Kamanga",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
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
