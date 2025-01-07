import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http; // Tambahkan paket http
import 'package:kampus/blocs/discount_approve/discount_approve_bloc.dart';
import 'package:kampus/blocs/discount_mahasiswa/discount_mahasiswa_bloc.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';
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
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<String> _checkedItems = [];

  Future<void> _sendData() async {
    if (_checkedItems.isEmpty) {
      showSnackbar(context, 'Info', 'No items selected!', 'info');
      return;
    }

    final payload = {
      "checklistData": _checkedItems.map((id) => {"approvalkey": id}).toList(),
    };

    try {
      final response = await http.post(
        Uri.parse(
            'https://ams-api-dev.univbatam.ac.id/index.php/owner/prosesapprovaldiskon'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        showSnackbar(context, 'Success', "Data sent successfully!", 'success');
      } else {
        showSnackbar(context, 'Error', response.body, 'error');
      }
    } catch (e) {
      showSnackbar(context, 'Error', e.toString(), 'error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0.5,
          title: Text(
            'Discount',
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
                child: const Text('Non Approve'),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: const Text('Approve'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) =>
                  DiscountMahasiswaBloc()..add(DiscountMahasiswatGet()),
              child: BlocBuilder<DiscountMahasiswaBloc, DiscountMahasiswaState>(
                builder: (context, state) {
                  if (state is DiscountMahasiswaLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DiscountMahasiswaSuccess) {
                    // Filter data berdasarkan _searchText
                    final filteredData = state.discount.where((discount) {
                      final discountName = discount.nama ?? '';
                      return discountName
                          .toLowerCase()
                          .contains(_searchText.toLowerCase());
                    }).toList();

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search by name',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _searchText = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: filteredData.map((discountMethod) {
                              final id = '${discountMethod.approvalKey}';
                              return ListUnpaid(
                                discountMethod: discountMethod,
                                isChecked: _checkedItems.contains(id),
                                onChanged: (isChecked) {
                                  setState(() {
                                    if (isChecked == true) {
                                      _checkedItems.add(id);
                                    } else {
                                      _checkedItems.remove(id);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomFilledButton(
                            title: 'Approval',
                            width: double.infinity,
                            onPressed: _sendData,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            margin: const EdgeInsets.only(top: 12),
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/img_no_data.png'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              text: 'Oops! Sepertinya kamu tidak\nmemiliki ',
                              style: blackTextStyle.copyWith(fontSize: 12),
                              children: [
                                TextSpan(
                                  text: 'Data Mahasiswa',
                                  style: blueTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' hari ini',
                                  style: blackTextStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            BlocProvider(
              create: (context) =>
                  DiscountApproveBloc()..add(DiscountApproveGet()),
              child: BlocBuilder<DiscountApproveBloc, DiscountApproveState>(
                builder: (context, state) {
                  if (state is DiscountApproveLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DiscountApproveSuccess) {
                    final filteredData =
                        state.discountApprove.where((discount) {
                      final discountName = discount.nama ?? '';
                      return discountName
                          .toLowerCase()
                          .contains(_searchText.toLowerCase());
                    }).toList();

                    return Column(
                      children: [
                        // Search Bar
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search by name',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _searchText = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: filteredData.map((discountApprove) {
                              return ListPaid(
                                  discountApproveMethod: discountApprove);
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            margin: const EdgeInsets.only(top: 12),
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/img_no_data.png'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              text: 'Oops! Sepertinya kamu tidak\nmemiliki ',
                              style: blackTextStyle.copyWith(fontSize: 12),
                              children: [
                                TextSpan(
                                  text: 'Data Mahasiswa',
                                  style: blueTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' hari ini',
                                  style: blackTextStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
