import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_calculator/src/widget/key_button.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List _key = [
    ["7", "8", "9"],
    ["4", "5", "6"],
    ["1", "2", "3"],
    ["AC", "0", CupertinoIcons.arrow_left]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('송금하기', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '보낼 금액을 입력하세요!',
                style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w100, color: Colors.black),
              ),
            ),
            _resultView(),
            _keyButtonView(),
          ],
        ),
      ),
    );
  }

  Widget _resultView() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "0원",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w100, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _keyButtonView() {
    return Column(
      children: List.generate(
          _key.length,
          (y) => Row(
                children: List.generate(
                  _key[y].length,
                  (x) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: KeyButton(
                        label: _key[y][x],
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
