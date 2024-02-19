import 'dart:ui';
import 'package:day2/page_view_screens/screens/view_3.dart';
import 'package:day2/page_view_screens/screens/view_2.dart';
import 'package:day2/page_view_screens/screens/view_1.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    int index = 0;
    return Scaffold(
      body: PageView(
        // physics: const BouncingScrollPhysics(),
        scrollBehavior: MouseScroll(),
        onPageChanged: (i) => index = i,
        controller: controller,
        children: const [
          View1(),
          View2(),
          View3(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.arrow_forward_ios),
        onPressed: () => index != 2
            ? controller.nextPage(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
              )
            : controller.animateToPage(
                0,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
              ),
      ),
    );
  }
}

class MouseScroll extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      };
}
