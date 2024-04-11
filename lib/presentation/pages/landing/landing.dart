// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:app/presentation/components/card_list.dart';
import 'package:app/presentation/components/sticky_sliver.dart';
import 'package:app/presentation/pages/settings/card_settings/add_balance/add_balance.dart';
import 'package:app/presentation/pages/landing/card_details.dart';
import 'package:app/providers/total_amount_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../providers/card_provide.dart';

class Landing extends ConsumerWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsAsyncValue = ref.watch(cardProvider);
    Color primary = HexColor("#fbeace");
    // Color secondary = HexColor("#fffae7");

    return Scaffold(
      // bottomNavigationBar: ,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        title: Text(
          "Steven Kamanga",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: cardsAsyncValue.when(
          data: (cards) {
            return Scaffold(
              backgroundColor: primary,
              body: RefreshIndicator(
                onRefresh: () async {
                  // ignore: unused_result
                  ref.refresh(cardProvider);
                  // ignore: unused_result
                  ref.refresh(totalAmountProvider);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Container(
                              color: Colors.transparent,
                              child: HeaderText(),
                            ),
                          ],
                        ),
                      ),
                      StickySliver(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            color: primary,
                            child: TotalValue(),
                          ),
                        ),
                      ),
                      ...cards.map(
                        (e) => SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CardDetailsScreen(
                                      id: e.id!,
                                      cardNumber: e.cardProductToken!,
                                      cvvNumber: e.cvvNumber!,
                                      lastFour: e.lastFour!,
                                      expiration: e.expiration!,
                                    ),
                                  ),
                                );
                              },
                              child: CardList(
                                cardNumber: e.cardProductToken!,
                                expiration: e.expiration!,
                                cvvNumber: e.cvvNumber!,
                                lastFour: e.lastFour!,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          loading: () => CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Manage Your Cards ',
                    style: TextStyle(fontSize: 60, color: Colors.black),
                  ),
                  TextSpan(
                    text: '(3)',
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 74, 74, 74)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class TotalValue extends ConsumerWidget {
  const TotalValue({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAmountAsyncValue = ref.watch(totalAmountProvider);
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total Budget",
            style:
                TextStyle(fontSize: 17, color: Color.fromARGB(255, 74, 74, 74)),
          ),
          totalAmountAsyncValue.when(
            data: (totalAmount) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'MWk',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 74, 74, 74)),
                            ),
                            TextSpan(
                              text: totalAmount,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                            TextSpan(
                              text: '.00',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 74, 74, 74)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 60, 60, 60),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddBalance()),
                                );
                              },
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'),
          ),
        ],
      ),
    );
  }
}
