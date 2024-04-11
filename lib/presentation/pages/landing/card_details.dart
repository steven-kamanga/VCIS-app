// ignore_for_file: prefer_const_constructors

import 'package:app/presentation/components/card_back.dart';
import 'package:app/presentation/pages/settings/card_settings/card_settings.dart';
import 'package:app/providers/funding_provider.dart';
import 'package:app/providers/velocity_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../providers/fundingProvider.dart';

class CardDetailsScreen extends ConsumerWidget {
  final int id;
  final String cardNumber;
  final String cvvNumber;
  final String lastFour;
  final String expiration;

  const CardDetailsScreen({
    super.key,
    required this.id,
    required this.cardNumber,
    required this.cvvNumber,
    required this.lastFour,
    required this.expiration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final funding = ref.watch(fundingProvider(id));
    final velocityControl = ref.watch(velocityControlProvider(id));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardSettings()),
                );
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
        title: Text('Card Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CardBack(
                cardNumber: cardNumber,
                cvvNumber: cvvNumber,
                expiration: expiration,
                lastFour: lastFour),
            velocityControl.when(
                data: (control) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Velocity Controls",
                          style: TextStyle(fontSize: 40),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : ${control.name}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Usage Limit : ${control.usageLimit}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Amount Limit: ${control.amountLimit!}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Is Active: ${control.active}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Currency Code : ${control.currencyCode}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Include Purchases: ${control.includePurchases!}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stack) => Text(error.toString()),
                loading: () => const Text("Loading")),
            funding.when(
                data: (funds) {
                  return Text(
                    "Current Amount:${funds.amount}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  );
                },
                error: (error, stack) => Text(error.toString()),
                loading: () => const Text("Loading"))
          ],
        ),
      ),
    );
  }
}
