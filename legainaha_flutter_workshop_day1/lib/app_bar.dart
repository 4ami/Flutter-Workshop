import 'package:flutter/material.dart';

///[AppBarWidget] @could be a challenge [U_can_modify]
///
class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Some Title!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
        actions: const [
          Icon(Icons.settings),
          SizedBox(width: 20),
          Icon(Icons.person),
          SizedBox(width: 20),
        ],
        toolbarHeight: 70,
        backgroundColor: Colors.brown[200],
        foregroundColor: Colors.black,
        bottom: const Tab(
            child: Text('Travil or Pay', style: TextStyle(fontSize: 30))),
      ),
      body: ListView(
        children: [
          TabBar(
            indicatorColor: Colors.brown,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5,
            overlayColor: MaterialStatePropertyAll(Colors.brown[100]),
            labelColor: Colors.brown,
            onTap: (i) => setState(() {
              _pageController.animateToPage(
                i,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            }),
            controller: _controller,
            tabs: const [
              Icon(Icons.airplanemode_active),
              Icon(Icons.payments_rounded),
            ],
          ),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: PageView(
              controller: _pageController,
              onPageChanged: (i) => setState(() {
                _controller.index = i;
              }),
              children: const [
                Center(
                  child: Icon(
                    Icons.flight_takeoff,
                    size: 250,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.money,
                    size: 250,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
