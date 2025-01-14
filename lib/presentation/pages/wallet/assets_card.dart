import 'package:flutter/material.dart';

class AssetsCard extends StatelessWidget {
  const AssetsCard({
    super.key,
    required this.cardSecondary,
  });

  final Color cardSecondary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: cardSecondary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Color.fromARGB(255, 211, 211, 211),
                              ),
                              child: const Icon(Icons.currency_bitcoin),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const SizedBox(
                              height: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Bitcoin",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "BTC",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 74, 74, 74),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.show_chart,
                        size: 30,
                      ),
                      SizedBox(
                        width: 125,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'MWk ',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 74, 74, 74),
                                          ),
                                        ),
                                        TextSpan(
                                          text: "30,000",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: '.00',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 74, 74, 74),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text("-12.28%")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
