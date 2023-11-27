import 'package:flutter/material.dart';

class FavouritesCard extends StatelessWidget {
  const FavouritesCard({
    super.key,
    required this.cardSecondary,
  });

  final Color cardSecondary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 180,
            decoration: BoxDecoration(
              color: cardSecondary,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Color.fromARGB(255, 211, 211, 211),
                          ),
                          child: const Icon(
                            Icons.currency_pound,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const SizedBox(
                          height: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pound",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              Text("GBP"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: SizedBox(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.currency_pound,
                            size: 20,
                            color: Color.fromARGB(255, 74, 74, 74),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "20,000",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: '.00',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 74, 74, 74),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    child: SizedBox(
                      child: Container(
                        width: 80,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 211, 211, 211),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_outward,
                              size: 20,
                              color: Color.fromARGB(255, 74, 74, 74),
                            ),
                            RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "+9.0",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255, 74, 74, 74),
                                    ),
                                  ),
                                  TextSpan(
                                    text: '%',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 74, 74, 74),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
