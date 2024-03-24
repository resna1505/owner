import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/datatable_khs.dart';
import 'package:kampus/ui/widgets/header_nilai.dart';

class KHSPage extends StatefulWidget {
  const KHSPage({super.key});

  @override
  State<KHSPage> createState() => _KHSPageState();
}

class _KHSPageState extends State<KHSPage> {
  _KHSPageState() {
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
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'KHS',
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
                title: 'TOTAL SKS',
                value: '6',
                color: 1,
              ),
              HeaderNilai(
                title: 'IPS',
                value: '3.53',
                color: 2,
              )
            ],
          ),
          const SizedBox(
            height: 540,
            child: SingleChildScrollView(
              child: Column(
                children: [DataTableKHS()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
