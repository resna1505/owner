import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/list_campus_news.dart';

class CampusNews extends StatelessWidget {
  const CampusNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Berita Kampus',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListCampusNews(
            onTap: () {
              Navigator.pushNamed(context, '/campus-news-detail');
            },
            logo: 'IMG',
            header: 'Good News From Indonesia',
            mitra: 'IPTEK',
            time: '9 hour ago',
            title:
                'Alternatif Solusi di Negara Kepulauan, PT PAL dan UNHAN salurkan Rumah Apung',
            subtitle:
                'PT PAL dan UNHAN salurkan rumah apung untuk solusi masyarakat di negara kepulauan. Serah terima ini diberikan kepada masyarakat langsung.',
          ),
          const ListCampusNews(
            logo: 'IMG',
            header: 'Good News From Indonesia',
            mitra: 'IPTEK',
            time: '9 hour ago',
            title:
                'Alternatif Solusi di Negara Kepulauan, PT PAL dan UNHAN salurkan Rumah Apung',
            subtitle:
                'PT PAL dan UNHAN salurkan rumah apung untuk solusi masyarakat di negara kepulauan. Serah terima ini diberikan kepada masyarakat langsung.',
          ),
          const ListCampusNews(
            logo: 'IMG',
            header: 'Good News From Indonesia',
            mitra: 'IPTEK',
            time: '9 hour ago',
            title:
                'Alternatif Solusi di Negara Kepulauan, PT PAL dan UNHAN salurkan Rumah Apung',
            subtitle:
                'PT PAL dan UNHAN salurkan rumah apung untuk solusi masyarakat di negara kepulauan. Serah terima ini diberikan kepada masyarakat langsung.',
          ),
          const ListCampusNews(
            logo: 'IMG',
            header: 'Good News From Indonesia',
            mitra: 'IPTEK',
            time: '9 hour ago',
            title:
                'Alternatif Solusi di Negara Kepulauan, PT PAL dan UNHAN salurkan Rumah Apung',
            subtitle:
                'PT PAL dan UNHAN salurkan rumah apung untuk solusi masyarakat di negara kepulauan. Serah terima ini diberikan kepada masyarakat langsung.',
          ),
          const ListCampusNews(
            logo: 'IMG',
            header: 'Good News From Indonesia',
            mitra: 'IPTEK',
            time: '9 hour ago',
            title:
                'Alternatif Solusi di Negara Kepulauan, PT PAL dan UNHAN salurkan Rumah Apung',
            subtitle:
                'PT PAL dan UNHAN salurkan rumah apung untuk solusi masyarakat di negara kepulauan. Serah terima ini diberikan kepada masyarakat langsung.',
          ),
        ],
      ),
    );
  }
}
