import 'package:flutter/material.dart';
import 'package:tacaro/shared/models/user_model.dart';
import 'package:tacaro/shared/theme/app_theme.dart';
import 'package:tacaro/shared/widgets/bottom_navigator/app_bottom_navigator.dart';
import 'package:tacaro/shared/widgets/card_chart/card_chart.dart';
import 'package:tacaro/shared/widgets/card_product/card_product.dart';
import 'package:tacaro/shared/widgets/list_tile/app_list_tile.dart';

class HomePage extends StatefulWidget {
  // final UserModel user;
  const HomePage({
    Key? key,
    // required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CardChart(
                  value: 321,
                  percent: 0,
                ),
              ),
              SizedBox(height: 28),
              SizedBox(
                height: 126,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => CardProduct(
                    like: index % 2 == 0,
                  ),
                ),
              ),
              AppListTile(),
              AppListTile(),
              AppListTile(),
            ],
          ),
          Positioned(
            left: 26,
            right: 26,
            bottom: 14,
            child: AppBottomNavigator(
              currentIndex: currentIndex,
              onChanged: changeIndex,
            ),
          ),
        ],
      ),
    );
  }
}
