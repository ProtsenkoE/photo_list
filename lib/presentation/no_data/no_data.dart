import 'package:flutter/material.dart';
import 'package:photo_list/presentation/common/constants/constants.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(height: 400.0),
          Center(
            child: Text(
              noData,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
