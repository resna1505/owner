import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';
import 'package:kampus/ui/widgets/home_academy_item.dart';
import 'package:kampus/ui/widgets/home_campus_news.dart';
import 'package:kampus/ui/widgets/home_to_do.dart';

class HomePageMahasiswa extends StatefulWidget {
  const HomePageMahasiswa({super.key});

  @override
  State<HomePageMahasiswa> createState() => _HomePageMahasiswaState();
}

class _HomePageMahasiswaState extends State<HomePageMahasiswa> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        // color: whiteColor,
        // shape: const CircularNotchedRectangle(),
        // clipBehavior: Clip.antiAlias,
        // notchMargin: 6,
        // elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedItemColor: purpleColor,
          unselectedItemColor: greyColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_home.png',
                width: 25,
                color: _currentIndex == 0 ? purpleColor : greyColor,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_explore.png',
                width: 25,
                color: _currentIndex == 1 ? purpleColor : greyColor,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_room.png',
                width: 25,
                color: _currentIndex == 2 ? purpleColor : greyColor,
              ),
              label: 'Class Room',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_chat.png',
                width: 25,
                color: _currentIndex == 3 ? purpleColor : greyColor,
              ),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_account.png',
                width: 25,
                color: _currentIndex == 4 ? purpleColor : greyColor,
              ),
              label: 'Account',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      body: ListView(
        children: [
          if (_currentIndex == 0) ...[
            buildProfile(context),
            buildSchedule(),
            buildToDo(context),
            buildAcademy(context),
            buildCampusNews(context),
          ],
          if (_currentIndex == 1) ...[
            const Center(child: Text('Explore')),
          ],
          if (_currentIndex == 2) ...[
            const Center(child: Text('Class Room')),
          ],
          if (_currentIndex == 3) ...[
            const Center(child: Text('Chats')),
          ],
          if (_currentIndex == 4) ...[
            const Center(child: Text('Account')),
          ],
        ],
      ),
      // body: tabs[_currentIndex],
    );
  }

  Widget buildProfile(context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
        top: 10,
        bottom: 16,
      ),
      color: lightBackgroundColor,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RESNA TRI PANGESTU',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Mahasiswa | Teknik Informatika',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/img_profile.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/notification-mahasiswa');
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: purpleColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Icon(
                    Icons.notifications_none,
                    color: whiteColor,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: greenColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Icon(
                  Icons.qr_code_scanner,
                  color: whiteColor,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  Widget buildSchedule() {
    return Container(
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Schedule',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    'This is your collage class schedule board',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: purpleColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: whiteColor,
                  size: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 6,
              top: 4,
              right: 6,
              bottom: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: greySoftColor,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Today',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 11,
                    left: 11,
                  ),
                  child: Text(
                    'Mon',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 11,
                    left: 11,
                  ),
                  child: Text(
                    'Tue',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 11,
                    left: 11,
                  ),
                  child: Text(
                    'Wed',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius:
                        BorderRadius.circular(100), // Memberikan radius 100
                  ),
                  child: Text(
                    'Thurs',
                    style: whiteTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 11,
                    left: 11,
                  ),
                  child: Text(
                    'Fri',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              18,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: whiteColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  // offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: greySoftColor,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '26th',
                        style: greyDarkTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Oct',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/img_no_data.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Oops ! Looks like you don’t have\nany ',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: 'active schedule',
                                style: blueTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: semiBold,
                                ),
                              ),
                              TextSpan(
                                text: ' this day',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildToDo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: redColor,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'My To-Do',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'This is your personal to-do list',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              CustomButtonOutline(
                title: 'All To-Do',
                onTap: () {
                  Navigator.pushNamed(context, '/todo');
                },
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(
              16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: whiteColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              children: [
                HomeToDo(
                  title: 'Final Quiz',
                  status: 'Incomplete',
                  date: '22th, Mar 2024',
                  onTap: () {},
                ),
                HomeToDo(
                  title: 'Semester Exam',
                  status: 'Completed',
                  date: '23th, Feb 2024',
                  onTap: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }

  Widget buildAcademy(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Academy Access',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Text(
            'Your easy access of academy needs',
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeAcademyItem(
                iconUrl: 'assets/ic_ktm.png',
                title: 'Kartu\nMahasiswa',
                color: const Color(0xffFFF1D3),
                onTap: () {
                  Navigator.pushNamed(context, '/card-mahasiswa');
                },
              ),
              HomeAcademyItem(
                iconUrl: 'assets/ic_keuangan.png',
                title: 'Keuangan',
                color: const Color(0xffD9F1E4),
                onTap: () {
                  Navigator.pushNamed(context, '/invoice-payment');
                },
              ),
              HomeAcademyItem(
                iconUrl: 'assets/ic_krs.png',
                title: 'KRS',
                color: const Color(0xffEEF5F8),
                onTap: () {
                  Navigator.pushNamed(context, '/krs');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeAcademyItem(
                iconUrl: 'assets/ic_khs.png',
                title: 'KHS',
                color: const Color(0xffF5F8FF),
                onTap: () {
                  Navigator.pushNamed(context, '/khs');
                },
              ),
              HomeAcademyItem(
                iconUrl: 'assets/ic_bimbingan.png',
                title: 'Bimbingan\nTugas Akhir',
                color: const Color(0xffFFEDBD),
                onTap: () {
                  Navigator.pushNamed(context, '/thesis');
                },
              ),
              HomeAcademyItem(
                iconUrl: 'assets/ic_konsultasi.png',
                title: 'Konsultasi\nDosen',
                color: const Color(0xffC1FBE4),
                onTap: () {
                  Navigator.pushNamed(context, '/lecturer-consultation');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeAcademyItem(
                iconUrl: 'assets/ic_transkrip.png',
                title: 'Transkrip',
                color: const Color(0xffEBDBD8),
                onTap: () {
                  Navigator.pushNamed(context, '/transcript');
                },
              ),
              HomeAcademyItem(
                iconUrl: 'assets/ic_kemajuan.png',
                title: 'Kemajuan\nBelajar',
                color: const Color(0xffE4F1F4),
                onTap: () {
                  Navigator.pushNamed(context, '/learning-progress');
                },
              ),
              HomeAcademyItem(
                iconUrl: 'assets/ic_nilai.png',
                title: 'Nilai',
                color: const Color(0xffC1DAE6),
                onTap: () {
                  Navigator.pushNamed(context, '/assessment');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeAcademyItem(
                iconUrl: 'assets/ic_input_krs.png',
                title: 'Pengisian\nKRS',
                color: const Color(0xffE2E3E4),
                onTap: () {
                  Navigator.pushNamed(context, '/input-krs');
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCampusNews(context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Campus News',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                CustomButtonOutline(
                  title: 'All News',
                  onTap: () {
                    Navigator.pushNamed(context, '/campus-news');
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 18,
                ),
                HomeCampusNews(
                  imgUrl: 'assets/ic_news1.png',
                  title:
                      'Samsung kembangkan jaringan 6G yang sangat canggih dan inovatif',
                  subtitle:
                      'Jakarta (ANTARA) - Samsung Electronics Co mengatakan bahwa organisasi penelitian dan pengembangan Samsung Research America (SRA) telah mengembangkan teknologi jaringan generasi terbaru, 6G, yang menjanjikan ...',
                  onTap: () {
                    Navigator.pushNamed(context, '/campus-news-detail');
                  },
                ),
                HomeCampusNews(
                  imgUrl: 'assets/ic_news2.png',
                  title:
                      'Samsung kembangkan jaringan 6G yang sangat canggih dan inovatif',
                  subtitle:
                      'Jakarta (ANTARA) - Samsung Electronics Co mengatakan bahwa organisasi penelitian dan pengembangan Samsung Research America (SRA) telah mengembangkan teknologi jaringan generasi terbaru, 6G, yang menjanjikan ...',
                  onTap: () {},
                ),
                HomeCampusNews(
                  imgUrl: 'assets/ic_news1.png',
                  title:
                      'Samsung kembangkan jaringan 6G yang sangat canggih dan inovatif',
                  subtitle:
                      'Jakarta (ANTARA) - Samsung Electronics Co mengatakan bahwa organisasi penelitian dan pengembangan Samsung Research America (SRA) telah mengembangkan teknologi jaringan generasi terbaru, 6G, yang menjanjikan ...',
                  onTap: () {},
                ),
                HomeCampusNews(
                  imgUrl: 'assets/ic_news2.png',
                  title:
                      'Samsung kembangkan jaringan 6G yang sangat canggih dan inovatif',
                  subtitle:
                      'Jakarta (ANTARA) - Samsung Electronics Co mengatakan bahwa organisasi penelitian dan pengembangan Samsung Research America (SRA) telah mengembangkan teknologi jaringan generasi terbaru, 6G, yang menjanjikan ...',
                  onTap: () {},
                ),
                HomeCampusNews(
                  imgUrl: 'assets/ic_news1.png',
                  title:
                      'Samsung kembangkan jaringan 6G yang sangat canggih dan inovatif',
                  subtitle:
                      'Jakarta (ANTARA) - Samsung Electronics Co mengatakan bahwa organisasi penelitian dan pengembangan Samsung Research America (SRA) telah mengembangkan teknologi jaringan generasi terbaru, 6G, yang menjanjikan ...',
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
