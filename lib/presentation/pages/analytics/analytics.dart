import 'package:app/presentation/components/sticky_sliver.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    Color secondary = HexColor("#eafefd");
    Color primary = HexColor("#b4eef0");
    List<_SalesData> data = [
      _SalesData('Jan', 20),
      _SalesData('Feb', 34),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40),
      _SalesData('May', 23),
      _SalesData('May', 33)
    ];
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.only(left: 13.0, right: 13.0),
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
                [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 640,
                                  decoration: BoxDecoration(
                                    color: secondary,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                RichText(
                                                  text: const TextSpan(
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: '14 Dec',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      TextSpan(
                                                        text: ' 2022',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    74,
                                                                    74,
                                                                    74)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RichText(
                                                  text: const TextSpan(
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: 'MWk',
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    74,
                                                                    74,
                                                                    74)),
                                                      ),
                                                      TextSpan(
                                                        text: '26,561',
                                                        style: TextStyle(
                                                            fontSize: 40,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      TextSpan(
                                                        text: '.50',
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    74,
                                                                    74,
                                                                    74)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon:
                                                        const Icon(Icons.tune))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: SizedBox(
                                              height: 500,
                                              child: Column(children: [
                                                //Initialize the chart widget
                                                SfCartesianChart(
                                                    primaryXAxis:
                                                        CategoryAxis(),
                                                    // Chart title
                                                    title: ChartTitle(text: ''),
                                                    // Enable legend
                                                    legend: const Legend(
                                                        isVisible: false),
                                                    // Enable tooltip
                                                    tooltipBehavior:
                                                        TooltipBehavior(
                                                            enable: true),
                                                    series: <ChartSeries<
                                                        _SalesData, String>>[
                                                      LineSeries<_SalesData,
                                                              String>(
                                                          dataSource: data,
                                                          xValueMapper:
                                                              (_SalesData sales,
                                                                      _) =>
                                                                  sales.year,
                                                          yValueMapper:
                                                              (_SalesData sales,
                                                                      _) =>
                                                                  sales.sales,
                                                          name: 'Value',
                                                          // Enable data label
                                                          dataLabelSettings:
                                                              const DataLabelSettings(
                                                                  isVisible:
                                                                      true))
                                                    ]),
                                              ]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: SizedBox(
                                      height: 100,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: const TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '-3.2',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      color: Colors.white),
                                                ),
                                                TextSpan(
                                                  text: '%',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      color: Color.fromARGB(
                                                          255, 167, 167, 167)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Monthly Average",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 167, 167, 167)),
                                                ),
                                                Text(
                                                  "MWK 20,324.20",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
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

class HeaderString extends StatelessWidget {
  const HeaderString({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Analytics",
              style: TextStyle(fontSize: 60, color: Colors.black)),
          Padding(
            padding: EdgeInsets.only(bottom: 11),
            child: SizedBox(
              child: Row(
                children: [
                  Text(
                    "Dec",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
