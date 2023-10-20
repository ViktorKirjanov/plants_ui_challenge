import 'package:flutter/cupertino.dart';

class FouneHeader extends StatelessWidget {
  const FouneHeader({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: 90.0,
        child: Text(
          'Found \n11 Results',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
      );
}
