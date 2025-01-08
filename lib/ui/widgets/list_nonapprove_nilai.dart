import 'package:flutter/material.dart';
import 'package:kampus/models/nilai_non_approve_model.dart';
import 'package:kampus/shared/theme.dart';

class ListNonApproveNilai extends StatelessWidget {
  final NilaiNonApproveModel nilaiNonMethod;
  final bool isChecked;
  final Function(bool?) onChanged;

  const ListNonApproveNilai({
    super.key,
    required this.nilaiNonMethod,
    required this.isChecked,
    required this.onChanged,
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
          padding: const EdgeInsets.only(right: 16),
          child: CheckboxListTile(
            value: isChecked,
            onChanged: onChanged,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    nilaiNonMethod.nama ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Text(
                  ' (${nilaiNonMethod.id})',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Tanggal : ',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${nilaiNonMethod.tanggal ?? 0}',
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
                      nilaiNonMethod.namaProdi ?? '',
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
                      'Simbol Awal : ${nilaiNonMethod.simbolAwal ?? 0}',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Simbol Akhir : ${nilaiNonMethod.simbolAkhir ?? 0}',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
