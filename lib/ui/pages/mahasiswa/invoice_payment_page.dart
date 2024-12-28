import 'package:flutter/material.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/list_paid.dart';
import 'package:kampus/ui/widgets/list_unpaid.dart';

class InvoicePaymentPage extends StatefulWidget {
  const InvoicePaymentPage({
    super.key,
  });

  @override
  State<InvoicePaymentPage> createState() => _InvoicePaymentPageState();
}

class _InvoicePaymentPageState extends State<InvoicePaymentPage> {
  _InvoicePaymentPageState() {
    _selectedVal = _productSizeList[0];
  }

  final _productSizeList = [
    'Uang Kuliah',
    'Wisuda',
    'Biaya Konversi',
    'perpanjang ktm',
    'praktek gerontik',
    'Uang KTM',
  ];
  String _selectedVal = "Uang Kuliah";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0.5,
          title: Text(
            'Invoice Payment',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          bottom: TabBar(
            labelColor: purpleColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: const Text(
                  'Unpaid',
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: const Text(
                  'Payment History',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListUnpaid(
                        komponen: '1. Uang Kuliah',
                        biaya: formatCurrency(1000000),
                        tanggal: '1 Jan 2024',
                      ),
                      ListUnpaid(
                        komponen: '2. Wisuda',
                        biaya: formatCurrency(5000000),
                        tanggal: '2 Feb 2024',
                      ),
                      ListUnpaid(
                        komponen: '3. Almamater',
                        biaya: formatCurrency(350000),
                        tanggal: '1 Mar 2024',
                      ),
                      ListUnpaid(
                        komponen: '4. Uang Pangkal',
                        biaya: formatCurrency(500000),
                        tanggal: '1 Mar 2024',
                      ),
                      ListUnpaid(
                        komponen: '5. Uang Bangunan',
                        biaya: formatCurrency(6500000),
                        tanggal: '1 Mar 2024',
                      ),
                      ListUnpaid(
                        komponen: '6. Skripsi',
                        biaya: formatCurrency(2250000),
                        tanggal: '1 Mar 2024',
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: greySoftColor),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Billing',
                              style: greyDarkTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          formatCurrency(18750000),
                          style: redTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButtonFormField(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
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
                    labelText: 'Pilih Komponen',
                    border: InputBorder.none,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListPaid(
                        komponen: '1. Uang Kuliah',
                        biaya: formatCurrency(1000000),
                        tanggal: '1 Jan 2024',
                      ),
                      ListPaid(
                        komponen: '2. Uang Kuliah',
                        biaya: formatCurrency(1000000),
                        tanggal: '1 Feb 2024',
                      ),
                      ListPaid(
                        komponen: '3. Uang Kuliah',
                        biaya: formatCurrency(1000000),
                        tanggal: '1 Mar 2024',
                      ),
                      ListPaid(
                        komponen: '4. Uang Kuliah',
                        biaya: formatCurrency(1000000),
                        tanggal: '1 Apr 2024',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: greySoftColor),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sisa Pembayaran',
                              style: greyDarkTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          formatCurrency(4000000),
                          style: redTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
