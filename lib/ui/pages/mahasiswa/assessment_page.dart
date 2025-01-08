import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kampus/blocs/nilai_approve/nilai_approve_bloc.dart';
import 'package:kampus/blocs/nilai_non_approve/nilai_non_approve_bloc.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';
import 'package:kampus/ui/widgets/list_approve_nilai.dart';
import 'package:kampus/ui/widgets/list_nonapprove_nilai.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({
    super.key,
  });

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<String> _checkedItems = [];

  Future<void> _sendData() async {
    if (_checkedItems.isEmpty) {
      showSnackbar(context, 'Info', 'No items selected!', 'info');
      return;
    }

    final payload = {
      "iduser": "elly",
      "checklistData": _checkedItems.map((id) => {"approvalkey": id}).toList(),
    };

    try {
      final response = await http.post(
        Uri.parse(
            'https://ams-api-dev.univbatam.ac.id/index.php/owner/prosesapprovalkrs'),
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
            'Nilai',
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
                  NilaiNonApproveBloc()..add(NilaiNonApproveGet()),
              child: BlocBuilder<NilaiNonApproveBloc, NilaiNonApproveState>(
                builder: (context, state) {
                  if (state is NilaiNonApproveLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NilaiNonApproveSuccess) {
                    final filteredData = state.nilai.where((nilaiNon) {
                      final nilaiNonName = nilaiNon.nama ?? '';
                      return nilaiNonName
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
                            children: filteredData.map((nilaiNonMethod) {
                              final id = '${nilaiNonMethod.approvalKey}';
                              return ListNonApproveNilai(
                                nilaiNonMethod: nilaiNonMethod,
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
              create: (context) => NilaiApproveBloc()..add(NilaiApproveGet()),
              child: BlocBuilder<NilaiApproveBloc, NilaiApproveState>(
                builder: (context, state) {
                  if (state is NilaiApproveLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NilaiApproveSuccess) {
                    final filteredData = state.nilai.where((krs) {
                      final krsName = krs.nama ?? '';
                      return krsName
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
                            children: filteredData.map((nilaiApproveMethod) {
                              return ListApproveNilai(
                                  nilaiApproveMethod: nilaiApproveMethod);
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
