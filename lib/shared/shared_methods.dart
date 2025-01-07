import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showSnackbar(
    BuildContext context, String title, String subtitle, String type) {
  // Kondisikan nilai type
  AnimatedSnackBarType snackBarType;

  if (type == 'error') {
    snackBarType = AnimatedSnackBarType.error;
  } else if (type == 'info') {
    snackBarType = AnimatedSnackBarType.info;
  } else if (type == 'success') {
    snackBarType = AnimatedSnackBarType.success;
  } else {
    snackBarType = AnimatedSnackBarType.success;
  }

  AnimatedSnackBar.rectangle(
    title,
    subtitle,
    type: snackBarType,
    brightness: Brightness.light,
  ).show(
    context,
  );
}

String formatCurrency(
  num number, {
  String symbol = 'Rp ',
}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  ).format(number);
}
