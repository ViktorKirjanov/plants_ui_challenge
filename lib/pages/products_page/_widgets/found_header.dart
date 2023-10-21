import 'package:flutter/cupertino.dart';

class FoundHeader extends StatelessWidget {
  const FoundHeader({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 90.0,
        child: Text(
          'Found \n$count Results',
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
      );
}
