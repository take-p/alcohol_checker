import 'package:flutter/material.dart';

import '../components/atoms/jump_button.dart';
import 'check.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/beer_jug.png", height: 200),
          const Center(
            child: Text(
              "アルコールチェッカー",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              JumpButton(text: "測定する", to: AlcoholCheckPage()),
              SizedBox(width: 16),
              JumpButton(text: "本アプリ\nについて"),
            ],
          ),
        ],
      ),
    );
  }
}
