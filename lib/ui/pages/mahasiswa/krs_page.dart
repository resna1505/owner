import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/header_nilai.dart';
import 'package:kampus/ui/widgets/list_krs.dart';

class KRSPage extends StatefulWidget {
  const KRSPage({super.key});

  @override
  State<KRSPage> createState() => _KRSPageState();
}

class _KRSPageState extends State<KRSPage> {
  _KRSPageState() {
    _selectedVal = _productSizeList[0];
  }

  // final _productController = TextEditingController();
  // final _productDesController = TextEditingController();
  // bool? _topProduct = false;
  // ProductTypeEnum? _productTypeEnum;

  final _productSizeList = [
    '2021/2022 Genap',
    '2021/2022 Gasal',
    '2020/2021 Genap',
    '2020/2021 Gasal',
    '2019/2020 Genap',
    '2019/2020 Gasal',
  ];
  String _selectedVal = "2021/2022 Genap";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: whiteColor,
        title: Text(
          'KRS',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField(
                  value: _selectedVal,
                  items: _productSizeList
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _selectedVal = val as String;
                      },
                    );
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: purpleColor,
                  ),
                  // dropdownColor: Colors.blue.shade50,
                  decoration: const InputDecoration(
                    labelText: 'Pilih Periode',
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          const Row(
            children: [
              HeaderNilai(
                title: 'SKS DIAMBIL',
                value: '21',
                color: 1,
              ),
              HeaderNilai(
                title: 'BATAS SKS',
                value: '24',
                color: 2,
              )
            ],
          ),
          const SizedBox(
            height: 550,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListKrs(
                    title: 'FINAL PROJECT SOFTWARE 1',
                    code: '155KB557',
                    sks: ' - 1SKS',
                    time: 'Senin, 18:30 s.d 20:00',
                  ),
                  ListKrs(
                    title: 'FINAL PROJECT SOFTWARE 2',
                    code: '155KB557',
                    sks: ' - 1SKS',
                    time: 'Senin, 20:10 s.d 21:40',
                  ),
                  ListKrs(
                    title: 'MATEMATIKA DISKRIT',
                    code: '155KB558',
                    sks: ' - 2SKS',
                    time: 'SELASA, 18:30 s.d 20:00',
                  ),
                  ListKrs(
                    title: 'HUKUM ISLAM',
                    code: '155KB559',
                    sks: ' - 4SKS',
                    time: 'SELASA, 20:10 s.d 21:40',
                  ),
                  ListKrs(
                    title: 'SISTEM BASIS DATA LANJUTAN',
                    code: '155KB512',
                    sks: ' - 3SKS',
                    time: 'RABU, 18:30 s.d 20:00',
                  ),
                  ListKrs(
                    title: 'GRAFIKA KOMPUTER',
                    code: '155KB557',
                    sks: ' - 1SKS',
                    time: 'KAMIS, 20:10 s.d 21:40',
                  ),
                  ListKrs(
                    title: 'ALGORITMA PEMROGRAMAN',
                    code: '155KB557',
                    sks: ' - 4SKS',
                    time: 'JUMAT, 18:30 s.d 20:00',
                  ),
                  ListKrs(
                    title: 'SISTEM OPERASI',
                    code: '155KB557',
                    sks: ' - 2SKS',
                    time: 'JUMAT, 20:10 s.d 21:40',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
