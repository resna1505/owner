import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';

class ListNilai extends StatelessWidget {
  final String code;
  final String sks;
  final String title;
  final String finalscore;
  final String grade;
  final int individu;
  final int bimbingan;
  final int laporan;
  final int kehadiran;
  final int prilaku;
  final int kelompok;

  const ListNilai({
    super.key,
    required this.code,
    required this.sks,
    required this.title,
    required this.finalscore,
    required this.grade,
    required this.individu,
    required this.bimbingan,
    required this.laporan,
    required this.kehadiran,
    required this.prilaku,
    required this.kelompok,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: greySoftColor,
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: purpleColor,
                ),
                child: Text(
                  code,
                  style: whiteTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '$sks SKS',
                style: blackTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14),
          ),
          Row(
            children: [
              SizedBox(
                width: 90,
                child: Text(
                  'Final Score ',
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Text(
                ': $finalscore',
                style: blackTextStyle.copyWith(fontSize: 14),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 90,
                child: Text(
                  'Grade ',
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Text(
                ': $grade',
                style: blackTextStyle.copyWith(fontSize: 14),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'TUGAS INDIVIDU ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Text(
                ': $individu',
                style: blackTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'BIMBINGAN ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Text(
                ': $bimbingan',
                style: blackTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'LAPORAN PRAKTIKUM ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Text(
                ': $laporan',
                style: blackTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'KEHADIRAN ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Text(
                ': $kehadiran',
                style: blackTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'PRILAKU ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Text(
                ': $prilaku',
                style: blackTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  'TUGAS KELOMPOK ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              Text(
                ': $kelompok',
                style: blackTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
