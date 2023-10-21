import 'package:flutter/material.dart';

class Slogan extends StatelessWidget {
  const Slogan({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 2,
        child: Center(
          child: RichText(
            text: const TextSpan(
              text: 'Enjoy your\n',
              style: TextStyle(
                color: Colors.black,
                fontSize: 42,
                fontWeight: FontWeight.w300,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Life with ',
                  style: TextStyle(),
                ),
                TextSpan(
                  text: 'Plants',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
