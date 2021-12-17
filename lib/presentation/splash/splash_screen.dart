import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_list/presentation/common/constants/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white70,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.0,
              height: 220.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('${AllImages().image}/logo.jpeg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            const Text(
              loadingText,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 15.0,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const SpinKitSpinningLines(
              size: 50.0,
              color: Colors.deepPurple,
            ),
          ],
        ),
      ],
    );
  }
}
