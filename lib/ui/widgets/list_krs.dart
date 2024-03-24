import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';

class ListKrs extends StatelessWidget {
  final String title;
  final String code;
  final String sks;
  final String time;

  const ListKrs({
    super.key,
    required this.title,
    required this.code,
    required this.sks,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greyColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              Text(
                code,
                style: greyDarkTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                sks,
                style: greyDarkTextStyle.copyWith(
                  fontSize: 14,
                ),
              )
            ],
          ),
          Text(
            time,
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
