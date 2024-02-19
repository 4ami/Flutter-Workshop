import 'package:day2/easy_page_view/screens/page_widget.dart';
import 'package:flutter/material.dart';

class EasyPageView extends StatefulWidget {
  const EasyPageView({super.key});

  @override
  State<EasyPageView> createState() => _EasyPageViewState();
}

List<Map<String, String>> item = [
  {
    "label": 'View 1',
    "image": 'assets/ocean.png',
  },
  {
    "label": 'View 2',
    "image": 'assets/saira.png',
  },
  {
    "label": 'View 3',
    "image": 'assets/eberhard.png',
  }
];

class _EasyPageViewState extends State<EasyPageView> {
  int index = 0;
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController(keepPage: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Multi views in single page',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        onPageChanged: (i) => setState(() => index = i),
        controller: controller,
        itemCount: 3,
        itemBuilder: (context, index) => PageTemplete(
            image: item[index]['image']!, label: item[index]['label']!),
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
