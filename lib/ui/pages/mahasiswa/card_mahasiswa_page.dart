import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http; // Tambahkan paket http
import 'package:kampus/blocs/beasiswa_approve/beasiswa_approve_bloc.dart';
import 'package:kampus/blocs/beasiswa_non_approve/beasiswa_non_approve_bloc.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/shared_values.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';
import 'package:kampus/ui/widgets/list_approve_beasiswa.dart';
import 'package:kampus/ui/widgets/list_nonapprove_beasiswa.dart';

class CardMahasiswaPage extends StatefulWidget {
  const CardMahasiswaPage({
    super.key,
  });

  @override
  State<CardMahasiswaPage> createState() => _CardMahasiswaPageState();
}

class _CardMahasiswaPageState extends State<CardMahasiswaPage> {
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
        Uri.parse('$baseUrl/owner/prosesapprovalbeasiswa'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        showSnackbar(context, 'Success', "Data sent successfully!", 'success');
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home-page-mahasiswa',
          (route) => false,
        );
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
            'Beasiswa',
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
                  BeasiswaNonApproveBloc()..add(BeasiswaNonApproveGet()),
              child:
                  BlocBuilder<BeasiswaNonApproveBloc, BeasiswaNonApproveState>(
                builder: (context, state) {
                  if (state is BeasiswaNonApproveLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BeasiswaNonApproveSuccess) {
                    // Filter data berdasarkan _searchText
                    final filteredData = state.beasiswaNon.where((beasiswaNon) {
                      final beasiswaNonName = beasiswaNon.nama ?? '';
                      return beasiswaNonName
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
                            children: filteredData.map((beasiswaNonMethod) {
                              final id = '${beasiswaNonMethod.approvalKey}';
                              // return ListUnpaid(
                              //   discountMethod: discountMethod,
                              //   isChecked: _checkedItems.contains(id),
                              //   onChanged: (isChecked) {
                              //     setState(() {
                              //       if (isChecked == true) {
                              //         _checkedItems.add(id);
                              //       } else {
                              //         _checkedItems.remove(id);
                              //       }
                              //     });
                              //   },
                              // );
                              return ListNonApproveBeasiswa(
                                beasiswaNonMethod: beasiswaNonMethod,
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
                  BeasiswaApproveBloc()..add(BeasiswaApproveGet()),
              child: BlocBuilder<BeasiswaApproveBloc, BeasiswaApproveState>(
                builder: (context, state) {
                  if (state is BeasiswaApproveLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BeasiswaApproveSuccess) {
                    final filteredData =
                        state.beasiswaApprove.where((discount) {
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
                              return ListApproveBeasiswa(
                                  beasiswaApproveMethod: discountApprove);
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
