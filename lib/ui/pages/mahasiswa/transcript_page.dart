import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/datatable_transcript.dart';
import 'package:kampus/ui/widgets/header_nilai.dart';

class TranscriptPage extends StatefulWidget {
  const TranscriptPage({super.key});

  @override
  State<TranscriptPage> createState() => _TranscriptPageState();
}

class _TranscriptPageState extends State<TranscriptPage> {
  _TranscriptPageState() {
    // _selectedVal = _productSizeList[0];
  }

  // final _productController = TextEditingController();
  // final _productDesController = TextEditingController();
  // bool? _topProduct = false;
  // ProductTypeEnum? _productTypeEnum;

  // final _productSizeList = [
  //   '2021/2022 Genap',
  //   '2021/2022 Gasal',
  //   '2020/2021 Genap',
  //   '2020/2021 Gasal',
  //   '2019/2020 Genap',
  //   '2019/2020 Gasal',
  // ];
  // String _selectedVal = "2021/2022 Genap";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Transkrip',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        children: const [
          // Container(
          //   padding: const EdgeInsets.all(12),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       DropdownButtonFormField(
          //         value: _selectedVal,
          //         items: _productSizeList
          //             .map(
          //               (e) => DropdownMenuItem(
          //                 child: Text(e),
          //                 value: e,
          //               ),
          //             )
          //             .toList(),
          //         onChanged: (val) {
          //           setState(
          //             () {
          //               _selectedVal = val as String;
          //             },
          //           );
          //         },
          //         icon: Icon(
          //           Icons.arrow_drop_down_circle,
          //           color: purpleColor,
          //         ),
          //         // dropdownColor: Colors.blue.shade50,
          //         decoration: const InputDecoration(
          //           labelText: 'Pilih Periode',
          //           border: InputBorder.none,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Row(
            children: [
              HeaderNilai(
                title: 'TOTAL SKS',
                value: '149',
                color: 1,
              ),
              HeaderNilai(
                title: 'IPK',
                value: '3.59',
                color: 2,
              )
            ],
          ),
          SizedBox(
            height: 600,
            child: SingleChildScrollView(
              child: Column(
                children: [DataTableTranscript()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
