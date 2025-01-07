import 'package:flutter/material.dart';
import 'package:kampus/models/beasiswa_non_approve_model.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';

class ListNonApproveBeasiswa extends StatelessWidget {
  final BeasiswaNonApproveModel beasiswaNonMethod;
  final bool isChecked; // Status checkbox
  final Function(bool?) onChanged; // Callback untuk perubahan checkbox

  const ListNonApproveBeasiswa({
    super.key,
    required this.beasiswaNonMethod,
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
            onChanged: onChanged, // Callback ke state utama
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    beasiswaNonMethod.nama ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Text(
                  ' (${beasiswaNonMethod.id})',
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
                      'Komponen : ',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      beasiswaNonMethod.komponen ?? '',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Jurusan : ',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      beasiswaNonMethod.namaProdi ?? '',
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
                      '${beasiswaNonMethod.persenBeasiswa ?? 0}%',
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
                      formatCurrency(beasiswaNonMethod.rupiahBeasiswa ?? 0),
                      style: blackTextStyle.copyWith(
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
