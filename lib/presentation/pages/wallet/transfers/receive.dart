import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class ReceiveValue extends StatelessWidget {
  const ReceiveValue({super.key});

  @override
  Widget build(BuildContext context) {
    Color secondary = HexColor("#eafefd");

    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        backgroundColor: secondary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Receive Money",
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          "Show this QR code to the person sending you money",
                          style: TextStyle(
                            color: Color.fromARGB(255, 131, 131, 131),
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          )),
                      height: 230,
                      width: 230,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SfBarcodeGenerator(
                          value: 'www.syncfusion',
                          symbology: QRCode(),
                          showValue: false,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          "Or generate a unique digital code.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 131, 131, 131),
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () {
                        // !Generate unique code
                        // just get it from the server
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Generate digital code",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
