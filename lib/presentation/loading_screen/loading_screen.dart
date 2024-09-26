import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: CircularProgressIndicator(
        color:Color(0xFFF06292),
        backgroundColor: Colors.white60,

      ),
    );
  }
}
