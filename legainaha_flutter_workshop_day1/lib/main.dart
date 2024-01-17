import 'package:flutter/material.dart';
import 'package:legainaha_flutter_workshop_day1/app_bar.dart';
import 'package:legainaha_flutter_workshop_day1/bottom_sheet.dart';
import 'package:legainaha_flutter_workshop_day1/layout_challenge.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Legainaha Flutter Workshop Day1',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.withOpacity(.6),
        toolbarHeight: 100,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello World!',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              _button(
                context,
                () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LayoutChallenge(),
                  ),
                ),
                'Layout Challenge ✊',
              ),
              const SizedBox(height: 50),
              _button(
                context,
                () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ModalBottomSheet(),
                  ),
                ),
                'Modal Sheet',
              ),
              const SizedBox(height: 50),
              _button(
                context,
                () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AppBarWidget(),
                  ),
                ),
                'App Bar',
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _button(BuildContext context, VoidCallback onPressed, String label) {
    return SizedBox(
      width: 330,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
          Colors.lightBlue.withOpacity(.6),
        )),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
