import 'package:flutter/material.dart';
import 'package:kampus/models/beasiswa_approve_model.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';

class ListApproveBeasiswa extends StatelessWidget {
  // final String komponen;
  // final String biaya;
  // final String tanggal;
  final BeasiswaApproveModel beasiswaApproveMethod;

  const ListApproveBeasiswa({
    super.key,
    // required this.komponen,
    // required this.biaya,
    // required this.tanggal,
    required this.beasiswaApproveMethod,
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
                      beasiswaApproveMethod.nama ?? '',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  Text(
                    ' (${beasiswaApproveMethod.id})',
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
                    'Komponen : ',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    beasiswaApproveMethod.komponen ?? '',
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
                    beasiswaApproveMethod.namaProdi ?? '',
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
                    beasiswaApproveMethod.angkatan ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Persen : ',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${beasiswaApproveMethod.persenBeasiswa ?? 0}%',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Rupiah : ',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    formatCurrency(beasiswaApproveMethod.rupiahBeasiswa ?? 0),
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
                    '${beasiswaApproveMethod.tanggalapproval ?? 0}',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
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
