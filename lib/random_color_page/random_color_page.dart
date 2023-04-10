import 'dart:math';
import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  final Random _random = Random();
  Color _backgroundColor = Colors.white;
  int _index = 0;
  final List<String> _words = [
    'Слава Україні',
    'Героям слава',
    'Слава нації',
    'Смерть ворогам',
    'Україна понад усе'
  ];

  void _changeColor() {
    _backgroundColor = Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  void _incrementIndex() {
    if (_index == _words.length - 1) {
      _index = 0;
    } else {
      _index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            _changeColor();
            _incrementIndex();
          });
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Привіт :)',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.yellow,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    _words[_index],
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: _index.isOdd
                              ? Colors.black54
                              : Colors.red.withOpacity(
                                  0.5,
                                ),
                        ),
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
