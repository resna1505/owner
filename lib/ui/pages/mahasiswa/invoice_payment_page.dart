import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http; // Tambahkan paket http
import 'package:kampus/blocs/discount_approve/discount_approve_bloc.dart';
import 'package:kampus/blocs/discount_mahasiswa/discount_mahasiswa_bloc.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/shared_values.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';
import 'package:kampus/ui/widgets/list_paid.dart';
import 'package:kampus/ui/widgets/list_unpaid.dart';

// Model untuk Prodi (sama seperti di CardMahasiswaPage)
class ProdiModel {
  final String idProdi;
  final String namaProdi;
  final String tingkatProdi;
  final String idDepartemen;
  final String namaDepartemen;

  ProdiModel({
    required this.idProdi,
    required this.namaProdi,
    required this.tingkatProdi,
    required this.idDepartemen,
    required this.namaDepartemen,
  });

  factory ProdiModel.fromJson(Map<String, dynamic> json) {
    return ProdiModel(
      idProdi: json['IDPRODI'] ?? '',
      namaProdi: json['NAMAPRODI'] ?? '',
      tingkatProdi: json['TINGKATPRODI'] ?? '',
      idDepartemen: json['IDDEPARTEMEN'] ?? '',
      namaDepartemen: json['NAMADEPARTEMEN'] ?? '',
    );
  }

  String get displayName => '$namaProdi ($tingkatProdi)';
}

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
  List<ProdiModel> _prodiList = [];
  String? _selectedProdiId;
  bool _isLoadingProdi = true;
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    _fetchProdiData();
  }

  // Fetch data prodi dari API (sama seperti di CardMahasiswaPage)
  Future<void> _fetchProdiData() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/akademik/prodi'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _prodiList = data.map((item) => ProdiModel.fromJson(item)).toList();
          _isLoadingProdi = false;
        });
      } else {
        setState(() {
          _isLoadingProdi = false;
        });
        showSnackbar(context, 'Error', 'Failed to load prodi data', 'error');
      }
    } catch (e) {
      setState(() {
        _isLoadingProdi = false;
      });
      showSnackbar(
          context, 'Error', 'Error loading prodi: ${e.toString()}', 'error');
    }
  }

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
        Uri.parse('$baseUrl/owner/prosesapprovaldiskon'),
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

  // Widget untuk dropdown filter prodi (sama seperti di CardMahasiswaPage)
  Widget _buildProdiFilter() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade500),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Filter by Prodi',
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
          ),
          value: _selectedProdiId,
          style: blackTextStyle.copyWith(
            fontSize: 14,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedProdiId = newValue;
              _checkedItems.clear();
              _selectAll = false;
            });
          },
          items: [
            DropdownMenuItem<String>(
              value: null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'All Prodi',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            ..._prodiList.map<DropdownMenuItem<String>>((ProdiModel prodi) {
              return DropdownMenuItem<String>(
                value: prodi.idProdi,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    prodi.displayName,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // Widget untuk checkbox "Select All" (sama seperti di CardMahasiswaPage)
  Widget _buildSelectAllCheckbox(List<dynamic> filteredData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Checkbox(
            value: _selectAll,
            onChanged: (bool? value) {
              setState(() {
                _selectAll = value ?? false;
                if (_selectAll) {
                  // Add all filtered items to checked list
                  _checkedItems.clear();
                  for (var item in filteredData) {
                    final id = '${item.approvalKey}';
                    _checkedItems.add(id);
                  }
                } else {
                  // Clear all selections
                  _checkedItems.clear();
                }
              });
            },
          ),
          Text(
            'Select All (${filteredData.length} items)',
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
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
                child: const Text('Approved'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Non Approve
            BlocProvider(
              create: (context) =>
                  DiscountMahasiswaBloc()..add(DiscountMahasiswatGet()),
              child: BlocBuilder<DiscountMahasiswaBloc, DiscountMahasiswaState>(
                builder: (context, state) {
                  if (state is DiscountMahasiswaLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DiscountMahasiswaSuccess) {
                    // Filter data berdasarkan _searchText dan prodi
                    final filteredData = state.discount.where((discount) {
                      final discountName = discount.nama ?? '';
                      final matchesSearch = discountName
                          .toLowerCase()
                          .contains(_searchText.toLowerCase());

                      // Filter berdasarkan prodi - sesuaikan dengan field yang ada di model discount
                      final matchesProdi = _selectedProdiId == null ||
                          discount.idProdi ==
                              _selectedProdiId; // Sesuaikan field ini dengan model discount Anda

                      return matchesSearch && matchesProdi;
                    }).toList();

                    return Column(
                      children: [
                        // Search Bar
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search by name',
                              prefixIcon: const Icon(Icons.search, size: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              isDense: true, // Membuat lebih compact
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _searchText = value;
                                _checkedItems.clear();
                                _selectAll = false;
                              });
                            },
                          ),
                        ),

                        // Prodi Filter
                        if (!_isLoadingProdi) _buildProdiFilter(),

                        // Select All Checkbox
                        if (filteredData.isNotEmpty)
                          _buildSelectAllCheckbox(filteredData),

                        // Data List
                        Expanded(
                          child: filteredData.isEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/img_no_data.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text.rich(
                                        TextSpan(
                                          text:
                                              'Oops! Sepertinya kamu tidak\nmemiliki ',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 12),
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
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              : ListView(
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
                                            _selectAll =
                                                false; // Uncheck select all if any item is unchecked
                                          }

                                          // Update select all status
                                          if (_checkedItems.length ==
                                              filteredData.length) {
                                            _selectAll = true;
                                          }
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                        ),

                        // Approval Button
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomFilledButton(
                            title:
                                'Approval (${_checkedItems.length} selected)',
                            width: double.infinity,
                            onPressed: _sendData,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
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

            // Tab Approve
            BlocProvider(
              create: (context) =>
                  DiscountApproveBloc()..add(DiscountApproveGet()),
              child: BlocBuilder<DiscountApproveBloc, DiscountApproveState>(
                builder: (context, state) {
                  if (state is DiscountApproveLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DiscountApproveSuccess) {
                    // Filter data berdasarkan _searchText dan prodi
                    final filteredData =
                        state.discountApprove.where((discount) {
                      final discountName = discount.nama ?? '';
                      final matchesSearch = discountName
                          .toLowerCase()
                          .contains(_searchText.toLowerCase());

                      // Filter berdasarkan prodi - sesuaikan dengan field yang ada di model discountApprove
                      final matchesProdi = _selectedProdiId == null ||
                          discount.idProdi ==
                              _selectedProdiId; // Sesuaikan field ini dengan model discountApprove Anda

                      return matchesSearch && matchesProdi;
                    }).toList();

                    return Column(
                      children: [
                        // Search Bar
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search by name',
                              prefixIcon: const Icon(Icons.search, size: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _searchText = value;
                                _checkedItems.clear();
                                _selectAll = false;
                              });
                            },
                          ),
                        ),

                        // Prodi Filter
                        if (!_isLoadingProdi) _buildProdiFilter(),

                        // Data List
                        Expanded(
                          child: filteredData.isEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/img_no_data.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'No data found',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
