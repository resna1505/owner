import 'package:flutter/material.dart';
import 'package:kampus/models/nilai_approve_model.dart';
import 'package:kampus/shared/theme.dart';

class ListApproveNilai extends StatelessWidget {
  // final String komponen;
  // final String biaya;
  // final String tanggal;
  final NilaiApproveModel nilaiApproveMethod;

  const ListApproveNilai({
    super.key,
    // required this.komponen,
    // required this.biaya,
    // required this.tanggal,
    required this.nilaiApproveMethod,
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
                      nilaiApproveMethod.nama ?? '',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  Text(
                    ' (${nilaiApproveMethod.id})',
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
                    nilaiApproveMethod.tanggal ?? '',
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
                    nilaiApproveMethod.namaProdi ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Simbol Awal : ${nilaiApproveMethod.simbolAwal ?? 0}',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Simbol Akhir : ${nilaiApproveMethod.simbolAkhir ?? 0}',
                    style: greyTextStyle.copyWith(
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
                    nilaiApproveMethod.tanggalapproval ?? '',
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
              //       '${nilaiApproveMethod.persenBeasiswa ?? 0}%',
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
              //       formatCurrency(nilaiApproveMethod.rupiahBeasiswa ?? 0),
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
