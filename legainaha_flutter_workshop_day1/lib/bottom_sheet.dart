import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * .5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.brown[100]),
                      child: const Center(child: Text('Modal Bottom Sheet')),
                    ),
                  );
                },
                child: const Text(
                  textAlign: TextAlign.center,
                  'Show Modal Bottom Sheet',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
