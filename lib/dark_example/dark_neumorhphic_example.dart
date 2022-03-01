import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/dark_example/widgets/amound_and_filter.dart';
import 'package:flutter_tutorial/dark_example/widgets/data_viz/data_viz.dart';
import 'package:flutter_tutorial/dark_example/widgets/header.dart';
import 'package:flutter_tutorial/dark_example/widgets/payment_item.dart';
import 'constants.dart';

class DarkNeuMorphicExample extends StatefulWidget {
  @override
  _DarkNeuMorphicExampleState createState() => _DarkNeuMorphicExampleState();
}

class _DarkNeuMorphicExampleState extends State<DarkNeuMorphicExample> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: SafeArea(
          child: (isMobile(context) ? mobilePage() : desktopPage()),
        ),
      ),
    );
  }

  Widget desktopPage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Header(),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chevron_left_rounded,
                        size: 60,
                        color: Colors.black45,
                      ),
                      Expanded(child: DataViz()),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 60,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: AmountAndFilter()),
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PaymentItem(
                        title: "Dark Souls",
                        category: "Games",
                        iconData: Icons.videogame_asset_rounded,
                        amount: "-\$54.00",
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      PaymentItem(
                        title: "Cinema Theater",
                        category: "Entertainment",
                        iconData: Icons.movie_creation_rounded,
                        amount: "-\$10.00",
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      PaymentItem(
                        title: "Other",
                        iconData: Icons.grid_on_rounded,
                        amount: "-\$130.00",
                      )
                    ],
                  ))
            ],
          ),
        )),
      ],
    );
  }

  Widget mobilePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Header(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              children: [
                Icon(
                  Icons.chevron_left_rounded,
                  size: 60,
                  color: Colors.black45,
                ),
                Expanded(child: DataViz()),
                Icon(Icons.chevron_right_rounded,
                    size: 60, color: Colors.black45),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(24.0), child: AmountAndFilter()),
          Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  PaymentItem(
                    title: "Dark Souls",
                    category: "Games",
                    iconData: Icons.videogame_asset_rounded,
                    amount: "-\$54.00",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  PaymentItem(
                    title: "Cinema Theater",
                    category: "Entertainment",
                    iconData: Icons.movie_creation_rounded,
                    amount: "-\$10.00",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  PaymentItem(
                    title: "Other",
                    iconData: Icons.grid_on_rounded,
                    amount: "-\$130.00",
                  )
                ],
              ))
        ],
      ),
    );
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }
}
