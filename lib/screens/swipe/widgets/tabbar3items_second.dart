import 'package:flutter/material.dart';
import 'package:new_feature/config/configs.dart';

class Tabbar3itemsSecond extends StatelessWidget {
  final TabController tabController;
  final BuildContext context;
  final VoidCallback onMapIconPressed;

  Tabbar3itemsSecond({
    Key? key,
    required this.tabController,
    required this.context,
    required this.onMapIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      Tab(
        child: Text('Marseille', style: TextStyle(fontSize: 14.0)),
      ),
      Tab(
        child: Text('PACA', style: TextStyle(fontSize: 14.0)),
      ),
      Tab(
        child: Text('France', style: TextStyle(fontSize: 14.0)),
      ),
    ];

    return SafeArea(
      child: Container(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TabBar(
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(),
                controller: tabController,
                labelStyle: AppTextStyles.labelSelectedStyle(context),
                labelColor: black,
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle:
                    AppTextStyles.labelUnselectedStyle(context),
                tabs: tabs,
              ),
            ),
            GestureDetector(
              onTap: onMapIconPressed,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(Icons.map),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
