import 'package:flutter/material.dart';
import 'package:kampus/models/discount_model.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';

class ListUnpaid extends StatelessWidget {
  final DiscountModel discountMethod;
  final bool isChecked; // Status checkbox
  final Function(bool?) onChanged; // Callback untuk perubahan checkbox

  const ListUnpaid({
    super.key,
    required this.discountMethod,
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
                    discountMethod.nama ?? '',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Text(
                  ' (${discountMethod.id})',
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
                      discountMethod.komponen ?? '',
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
                      discountMethod.namaProdi ?? '',
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
                      '${discountMethod.persenBeasiswa ?? 0}%',
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
                      formatCurrency(discountMethod.rupiahBeasiswa ?? 0),
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
