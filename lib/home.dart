import 'package:coding_test/components/buttons/rounded_button.dart';
import 'package:coding_test/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  List<int> primeNumbers = [];

  bool isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void _generatePrimeNumbers() {
    String input = _controller.text.trim();

    if (input.isEmpty) {
      Fluttertoast.showToast(
        msg: "Masukkan angka terlebih dahulu!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    int n = int.tryParse(input) ?? 0;
    if (n <= 0) {
      Fluttertoast.showToast(
        msg: "Masukkan angka yang valid!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
      return;
    }

    setState(() {
      primeNumbers = List.generate(n, (index) => index).where(isPrime).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/cup.png',
                  width: 24,
                  height: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Test Apps',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Bilangan Prima',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Masukan angka untuk menghasilkan bilangan prima',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan angka',
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RoundedButton(
                onPress: _generatePrimeNumbers,
                backgroundColor: HexColor('04764E'),
                textButton: "GENERATE BILANGAN PRIMA",
                textColor: Colors.white,
                borderRadius: 35,
              ),
            ),
            SizedBox(height: 20),
            if (primeNumbers.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Bilangan Prima:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    children: primeNumbers
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Chip(label: Text(e.toString())),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
