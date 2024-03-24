import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';

class DataTableKHS extends StatelessWidget {
  const DataTableKHS({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 35,
      sortColumnIndex: 0,
      sortAscending: true,
      columns: [
        DataColumn(
          label: Text(
            'Mata Kuliah',
            style: blackTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'SKS',
            style: blackTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          numeric: true,
        ),
        DataColumn(
          label: Text(
            'Nilai',
            style: blackTextStyle.copyWith(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          numeric: true,
        ),
        DataColumn(
          label: Text(
            'Huruf',
            style: blackTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          numeric: true,
        ),
      ],
      rows: data.map(
        (item) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  item['matakuliah'] ?? '',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              DataCell(
                Text(
                  item['sks'] ?? '',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              DataCell(
                Text(
                  item['nilai'] ?? '',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              DataCell(
                Text(
                  item['huruf'] ?? '',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}

List<Map<String, String>> data = [
  {
    'matakuliah': 'PEMODELAN DAN SIMULASI SISTEM',
    'sks': '3',
    'nilai': '96.38',
    'huruf': 'A '
  },
  {
    'matakuliah': 'INTELEGENSIA BUATAN',
    'sks': '4',
    'nilai': '77.21',
    'huruf': 'B+'
  },
  {
    'matakuliah': 'FINAL PROJECT SOFTWARE',
    'sks': '3',
    'nilai': '94.05',
    'huruf': 'A '
  },
  {'matakuliah': 'KERJA PRAKTEK', 'sks': '2', 'nilai': '50.02', 'huruf': 'A '},
  {
    'matakuliah': 'ANALISA DAN PERANCANGAN',
    'sks': '1',
    'nilai': '68.02',
    'huruf': 'B+'
  },
  {'matakuliah': 'MANAJEMEN UMUM', 'sks': '3', 'nilai': '85.00', 'huruf': 'A '},
  {'matakuliah': 'METODE NUMERIK', 'sks': '3', 'nilai': '85.00', 'huruf': 'A '},
  {'matakuliah': 'STRUKTUR DATA', 'sks': '4', 'nilai': '78.21', 'huruf': 'B+'},
];
