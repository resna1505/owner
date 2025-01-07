import 'package:flutter/material.dart';
import 'package:kampus/models/krs_non_approve_model.dart';
import 'package:kampus/shared/theme.dart';

class ListNonApproveKrs extends StatelessWidget {
  final KrsNonApproveModel krsNonMethod;
  final bool isChecked;
  final Function(bool?) onChanged;

  const ListNonApproveKrs({
    super.key,
    required this.krsNonMethod,
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
                    krsNonMethod.nama ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Text(
                  ' (${krsNonMethod.id})',
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
                      'Jurusan : ',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      krsNonMethod.namaProdi ?? '',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
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
                      '${krsNonMethod.tanggal ?? 0}',
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
