import 'package:flutter/material.dart';

class HeaderTextWallet extends StatelessWidget {
  const HeaderTextWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'MWk ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 74, 74, 74),
                ),
              ),
              TextSpan(
                text: "30,000",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              TextSpan(
                text: '.00',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 74, 74, 74),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.show_chart,
            size: 30,
          ),
        )
      ],
    );
  }
}
