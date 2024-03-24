import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/list_nilai.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  _AssessmentPageState() {
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
        backgroundColor: whiteColor,
        elevation: 0.5,
        title: Text(
          'Nilai',
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
          SizedBox(
            height: 590,
            child: SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: const Column(
                  children: [
                    ListNilai(
                      code: '155KB136',
                      sks: '1 ',
                      title: 'PRAKTIKUM PEMROGRAMAN WEB',
                      finalscore: '99.00',
                      grade: 'A',
                      individu: 100,
                      bimbingan: 100,
                      laporan: 100,
                      kehadiran: 100,
                      prilaku: 100,
                      kelompok: 95,
                    ),
                    ListNilai(
                      code: '155KB137',
                      sks: '1 ',
                      title: 'PRAKTIKUM HARDWARE DASAR',
                      finalscore: '99.00',
                      grade: 'A',
                      individu: 100,
                      bimbingan: 100,
                      laporan: 100,
                      kehadiran: 100,
                      prilaku: 100,
                      kelompok: 95,
                    ),
                    ListNilai(
                      code: '155KB138',
                      sks: '1 ',
                      title: 'PRAKTIKUM JARINGAN KOMPUTER',
                      finalscore: '99.00',
                      grade: 'A',
                      individu: 100,
                      bimbingan: 100,
                      laporan: 100,
                      kehadiran: 100,
                      prilaku: 100,
                      kelompok: 95,
                    ),
                    ListNilai(
                      code: '155KB139',
                      sks: '1 ',
                      title: 'PRAKTIKUM MOBILE APP DEVELOPMENT',
                      finalscore: '99.00',
                      grade: 'A',
                      individu: 100,
                      bimbingan: 100,
                      laporan: 100,
                      kehadiran: 100,
                      prilaku: 100,
                      kelompok: 95,
                    ),
                    ListNilai(
                      code: '155KB140',
                      sks: '1 ',
                      title: 'RANGKAIAN DIGITAL',
                      finalscore: '99.00',
                      grade: 'A',
                      individu: 100,
                      bimbingan: 100,
                      laporan: 100,
                      kehadiran: 100,
                      prilaku: 100,
                      kelompok: 95,
                    ),
                    ListNilai(
                      code: '155KB141',
                      sks: '1 ',
                      title: 'PENGANTAR AKUTANSI',
                      finalscore: '99.00',
                      grade: 'A',
                      individu: 100,
                      bimbingan: 100,
                      laporan: 100,
                      kehadiran: 100,
                      prilaku: 100,
                      kelompok: 95,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
