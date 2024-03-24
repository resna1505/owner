import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';

class InvoicePaymentPage extends StatelessWidget {
  const InvoicePaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Invoice Payment',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
