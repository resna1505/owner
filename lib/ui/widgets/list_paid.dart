import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';

class ListPaid extends StatelessWidget {
  final String komponen;
  final String biaya;
  final String tanggal;

  const ListPaid({
    super.key,
    required this.komponen,
    required this.biaya,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: greySoftColor),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    komponen,
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    biaya,
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    'Tanggal Bayar : ',
                    style: greyTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    tanggal,
                    style: redTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
