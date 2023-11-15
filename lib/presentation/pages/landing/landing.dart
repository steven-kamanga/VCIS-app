// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:app/presentation/components/card_list.dart';
import 'package:app/presentation/components/sticky_sliver.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    Color primary = HexColor("#fbeace");
    Color secondary = HexColor("#fffae7");
    return Scaffold(
        // bottomNavigationBar: ,
        appBar: AppBar(
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
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 60, 60, 60),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 13,
            )
          ],
        ),
        backgroundColor: primary,
        body: Padding(
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
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    color: primary,
                    child: TotalValue(),
                  ),
                ),
              ),
              ...List<int>.generate(3, (index) => index)
                  .map((e) => SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                          ),
                          child: CardList(
                            textColor: Colors.black,
                            color: secondary,
                            cardNumber: 2,
                          ),
                        ),
                      )),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 110,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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

class TotalValue extends StatelessWidget {
  const TotalValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total Budget",
            style:
                TextStyle(fontSize: 17, color: Color.fromARGB(255, 74, 74, 74)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'MWk',
                      style: TextStyle(
                          fontSize: 30, color: Color.fromARGB(255, 74, 74, 74)),
                    ),
                    TextSpan(
                      text: '26,561',
                      style: TextStyle(fontSize: 60, color: Colors.black),
                    ),
                    TextSpan(
                      text: '.50',
                      style: TextStyle(
                          fontSize: 30, color: Color.fromARGB(255, 74, 74, 74)),
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
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Steven Kamanga",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 60, 60, 60),
                ),
                borderRadius: BorderRadius.circular(50)),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
