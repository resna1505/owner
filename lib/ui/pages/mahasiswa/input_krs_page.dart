import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';

class InputKRS extends StatelessWidget {
  const InputKRS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Input KRS',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
