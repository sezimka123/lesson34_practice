import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Screen1(),
    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TextEditingController firstNum = TextEditingController();
  final TextEditingController secondNum = TextEditingController();
  num result = 0;
  String operation = "+";
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: firstNum,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        operation = "+";
                      });
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        operation = "-";
                      });
                    },
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        operation = "*";
                      });
                    },
                    child: const Text(
                      "*",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        operation = "/";
                      });
                    },
                    child: const Text(
                      "/",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ],
              ),
              Text(
                operation,
                style: const TextStyle(
                  fontSize: 26,
                ),
              ),
              TextField(
                controller: secondNum,
                decoration: const InputDecoration(),
                onChanged: (value) {
                  if (secondNum.text.isNotEmpty && firstNum.text.isNotEmpty) {
                    setState(() {
                      isActive = true;
                    });
                  } else {
                    setState(() {
                      isActive = false;
                    });
                  }
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isActive ? Colors.black : Colors.black.withOpacity(0.3),
                ),
                onPressed: isActive == false
                    ? null
                    : () {
                        switch (operation) {
                          case "+":
                            result = int.parse(firstNum.text) +
                                int.parse(secondNum.text);
                            break;
                          case "-":
                            result = int.parse(firstNum.text) -
                                int.parse(secondNum.text);
                            break;
                          case "*":
                            result = int.parse(firstNum.text) *
                                int.parse(secondNum.text);
                            break;
                          case "/":
                            result = int.parse(firstNum.text) /
                                int.parse(secondNum.text);
                            break;
                        }
                        setState(() {});
                      },
                child: const Text(
                  "Set State",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Text(
                "=",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "$result",
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
