import 'package:flutter/material.dart';

class TransactionButtons extends StatelessWidget {
  const TransactionButtons({
    super.key,
    required this.buttonPrimary,
    required this.buttonSecondary,
  });

  final Color buttonPrimary;
  final Color buttonSecondary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              SizedBox(
                child: Container(
                  height: 50,
                  width: 190,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: buttonPrimary),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: buttonSecondary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_upward_outlined,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Transfer",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              SizedBox(
                child: Container(
                  height: 50,
                  width: 190,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: buttonPrimary),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: buttonSecondary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Receive",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
