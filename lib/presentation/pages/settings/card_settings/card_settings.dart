// ignore_for_file: prefer_const_constructors

import 'package:app/presentation/components/sticky_sliver.dart';
import 'package:app/presentation/pages/settings/card_settings/associations/index.dart';
import 'package:app/presentation/pages/settings/card_settings/add_balance/add_balance.dart';
import 'package:app/presentation/pages/settings/card_settings/velocity_controls/index.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({super.key});

  @override
  Widget build(BuildContext context) {
    Color primary = HexColor("#b4eef0");

    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: CustomScrollView(
          slivers: [
            StickySliver(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  color: primary,
                  child: const HeaderString(),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [CardSettingsBody()],
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
    );
  }
}

class CardSettingsBody extends StatelessWidget {
  const CardSettingsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color secondary = HexColor("#eafefd");
    return SizedBox(
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddBalance(),
              ),
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Funding",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Activation Actions",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Associations(),
              ),
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Associations",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VelocityControl(),
              ),
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Velocity Controls",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderString extends StatelessWidget {
  const HeaderString({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Manage Your",
            style: TextStyle(
              fontSize: 60,
              color: Colors.black,
            ),
          ),
          RichText(
            text: const TextSpan(
              text: "Card",
              style: TextStyle(
                fontSize: 60,
                color: Color.fromARGB(
                  255,
                  117,
                  117,
                  117,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
