import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/information_detail.dart';

class CampusNewsDetail extends StatelessWidget {
  const CampusNewsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Information Detail',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        children: const [
          InformationDetail(
            title:
                'Samsung kembangkan jaringan 6G yang sangat canggih dan inovatif',
            from: 'Samsung',
            subtitle:
                'Jakarta (ANTARA) - Samsung Electronics Co mengatakan bahwa organisasi penelitian dan pengembangan Samsung Research America (SRA) telah bermitra dengan Universitas Princeton di Amerika Serikat untuk bersama-sama mengembangkan teknologi jaringan 6G generasi berikutnya.\n \nMelalui kolaborasi ini, SRA akan menjadi anggota pendiri "Program Afiliasi Perusahaan Inisiatif NextG" Universitas Princeton, yang bertujuan untuk mempelopori penelitian dan pengembangan dalam teknologi 6G, kata Samsung Electronics.',
          )
        ],
      ),
    );
  }
}
