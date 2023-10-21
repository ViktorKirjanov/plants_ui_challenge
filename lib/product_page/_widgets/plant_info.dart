import 'package:flutter/material.dart';

class PlantInfo extends StatelessWidget {
  const PlantInfo({super.key});

  @override
  Widget build(BuildContext context) => const Positioned(
        bottom: 300.0,
        left: 0.0,
        right: 0.0,
        child: IgnorePointer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'Lucky jade plant',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod. ',
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.6,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      );
}
