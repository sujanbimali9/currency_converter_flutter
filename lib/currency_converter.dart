import 'package:flutter/material.dart';

class CurrencyApp extends StatefulWidget {
  const CurrencyApp({super.key});
  @override
  State<CurrencyApp> createState() => _CurrencyAppState();
}

class _CurrencyAppState extends State<CurrencyApp> {
  double result = 0;
  int result1 = 0;
  final TextEditingController pressed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(23),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 81, 33, 33),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 67, 126, 155),
          title: const Text(
            'Currency Converter',
            style: TextStyle(
              color: Color.fromARGB(255, 29, 51, 89),
              fontSize: 25,
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (result1 == 0)
                ? Text(
                    'RS ${result.toString()}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 55),
                  )
                : const Text(
                    'error! enter a no',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
            Container(
              height: 60,
              width: 600,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                controller: pressed,
                style: const TextStyle(
                  color: Colors.green,
                ),
                onSubmitted: (value) {
                  if (double.tryParse(pressed.text) != null) {
                    result1 = 0;
                    result = double.parse(pressed.text) * 100;
                    setState(() {
                      result = double.parse(pressed.text) * 100;
                    });
                  } else {
                    result1 = 1;
                    setState(() {
                      result = 0;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: 'please insert the amount in \$',
                  prefixIcon: const Icon(Icons.monetization_on),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 85, 118, 151),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 55, 74, 88),
                minimumSize: const Size(200, 60),
                maximumSize: const Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                if (double.tryParse(pressed.text) != null) {
                  result1 = 0;
                  result = double.parse(pressed.text) * 100;
                  setState(() {
                    result = double.parse(pressed.text) * 100;
                  });
                } else {
                  result1 = 1;

                  setState(() {
                    result = 0;
                  });
                }
              },
              child: const Text(
                'Convert',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
