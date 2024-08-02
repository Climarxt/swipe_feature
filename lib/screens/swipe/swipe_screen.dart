import 'package:flutter/material.dart';
import 'package:new_feature/screens/screens.dart';
import 'package:new_feature/screens/swipe/widgets/widgets.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<SwipeScreen> {
  // Added mixin
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call this method for the mixin to work
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(62),
          child: Tabbar2items(tabController: _tabController, context: context)),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        SwipeCAT1(),
        WhiteScreen(title: "Catégorie 2",),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true; // Overridden to retain the state
}
