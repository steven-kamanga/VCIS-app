import 'package:app/presentation/pages/wallet/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'assets_card.dart';
import 'favourites_card.dart';
import 'header_text_wallet.dart';
import 'transaction_buttons.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    Color secondary = HexColor("#eafefd");
    Color cardSecondary = HexColor("#b5b8da");
    Color buttonPrimary = HexColor("c9d0e8");
    Color buttonSecondary = HexColor("a898fa");
    // Color cardPrimary = HexColor("e2e9f1");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondary,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            onTap: () {},
            child: const SizedBox(
              height: 40,
              width: 60,
              child: Row(
                children: [
                  Icon(Icons.add),
                  Icon(Icons.credit_card),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 13,
          )
        ],
      ),
      backgroundColor: secondary,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: const TextSpan(
                    text: "Current Value",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 74, 74, 74),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const HeaderTextWallet(),
                const SizedBox(
                  height: 18,
                ),
                TransactionButtons(
                  buttonPrimary: buttonPrimary,
                  buttonSecondary: buttonSecondary,
                ),
                const SizedBox(
                  height: 18,
                ),
                RichText(
                  text: const TextSpan(
                    text: "Favourites",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 74, 74, 74),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                FavouritesCard(
                  cardSecondary: cardSecondary,
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Assets",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 74, 74, 74),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_outlined,
                          color: Color.fromARGB(255, 74, 74, 74),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                AssetsCard(
                  cardSecondary: cardSecondary,
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Transactions",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 74, 74, 74),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_outlined,
                          color: Color.fromARGB(255, 74, 74, 74),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TransactionCard(
                  cardSecondary: cardSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
