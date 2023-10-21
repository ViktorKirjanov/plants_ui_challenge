import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Slogan extends StatelessWidget {
  const Slogan({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 2,
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'Enjoy your\n',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(42.0),
                fontWeight: FontWeight.w300,
              ),
              children: const <TextSpan>[
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
