import 'package:flutter/material.dart';

void main() {
  runApp(const MAPP());
}

class MAPP extends StatelessWidget {
  const MAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapp(),
    );
  }
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String phoneNumber = '';

  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3278A1).withOpacity(.01),
        title: const Text(
          'Profile App',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
        ),
      ),
      backgroundColor: const Color(0xff3278A1).withOpacity(.5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage("lib/images/User.jpg"),
              ),
              const Text(
                "Your Name",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "App Developer",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200.0,
                height: 20.0,
                child: Divider(
                  color: Colors.cyan[100],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                color: Colors.white,
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      phoneNumber = val;
                    });
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your phone number",
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Color(0xff3278A1),
                      size: 25,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                color: Colors.white,
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your email",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color(0xff3278A1),
                      size: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              ElevatedButton(
                onPressed: () {
                  if (phoneNumber.isNotEmpty && email.isNotEmpty) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          decoration: const BoxDecoration(
                              color: Color(0xff3278A1),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          height: MediaQuery.of(context).size.height * .5,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Done !",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Your phone number is: $phoneNumber",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Your email is: $email",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Color(0xff3278A1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
