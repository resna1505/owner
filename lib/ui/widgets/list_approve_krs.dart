import 'package:flutter/material.dart';
import 'package:kampus/models/krs_approve_model.dart';
import 'package:kampus/shared/theme.dart';

class ListApproveKrs extends StatelessWidget {
  // final String komponen;
  // final String biaya;
  // final String tanggal;
  final KrsApproveModel krsApproveMethod;

  const ListApproveKrs({
    super.key,
    // required this.komponen,
    // required this.biaya,
    // required this.tanggal,
    required this.krsApproveMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
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
                  Expanded(
                    child: Text(
                      krsApproveMethod.nama ?? '',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  Text(
                    ' (${krsApproveMethod.id})',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    'Tanggal : ',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    krsApproveMethod.tanggal ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Prodi : ',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    krsApproveMethod.namaProdi ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Angkatan : ',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    krsApproveMethod.angkatan ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Approval : ',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    krsApproveMethod.tanggalapproval ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Text(
              //       'Persen : ',
              //       style: greyTextStyle.copyWith(
              //         fontSize: 12,
              //       ),
              //     ),
              //     Text(
              //       '${krsApproveMethod.persenBeasiswa ?? 0}%',
              //       style: blackTextStyle.copyWith(
              //         fontSize: 12,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Text(
              //       'Rupiah : ',
              //       style: greyTextStyle.copyWith(
              //         fontSize: 12,
              //       ),
              //     ),
              //     Text(
              //       formatCurrency(krsApproveMethod.rupiahBeasiswa ?? 0),
              //       style: blackTextStyle.copyWith(
              //         fontSize: 12,
              //       ),
              //     ),
              //   ],
              // ),
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
