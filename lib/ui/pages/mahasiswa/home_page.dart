import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';
import 'package:kampus/ui/widgets/home_academy_item.dart';
import 'package:kampus/ui/widgets/home_campus_news.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/commons/axis.dart';
import 'package:d_chart/commons/viewport.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:kampus/ui/widgets/home_to_do.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

List<OrdinalData> ordinalList = [
  OrdinalData(domain: '1', measure: 3.25),
  OrdinalData(domain: '2', measure: 2.75),
  OrdinalData(domain: '3', measure: 3.55),
  OrdinalData(domain: '4', measure: 3.85),
  OrdinalData(domain: '5', measure: 2.95),
  OrdinalData(domain: '6', measure: 3.75),
  OrdinalData(domain: '7', measure: 3.55),
  OrdinalData(domain: '8', measure: 3.85),
];

final ordinalGroup = [
  OrdinalGroup(
    id: '1',
    data: ordinalList,
  ),
];

class HomePageMahasiswa extends StatefulWidget {
  const HomePageMahasiswa({super.key});

  @override
  State<HomePageMahasiswa> createState() => _HomePageMahasiswaState();
}

class _HomePageMahasiswaState extends State<HomePageMahasiswa> {
  int _currentIndex = 0;
  String qrResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
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
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.qr_code_scanner,
            //     color: _currentIndex == 2 ? purpleColor : greyColor,
            //     size: 30,
            //   ),
            //   label: 'absence',
            // ),
            // BottomNavigationBarItem(
            //   icon: Image.asset(
            //     'assets/ic_chat.png',
            //     width: 25,
            //     color: _currentIndex == 3 ? purpleColor : greyColor,
            //   ),
            //   label: 'Chats',
            // ),
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
            // if (index == 1) {
            //   Navigator.pushNamed(context, '/learning-progress');
            // }
          },
        ),
      ),
      body: ListView(
        children: [
          if (_currentIndex == 0) ...[
            buildProfile(context),
            // buildSchedule(),
            // buildToDo(context),
            buildAcademy(context),
            buildCampusNews(context),
          ],
          if (_currentIndex == 1) ...[
            buildExplore(context),
          ],
          if (_currentIndex == 2) ...[
            buildQrCode(context),
          ],
          if (_currentIndex == 3) ...[
            buildChats(context),
          ],
          if (_currentIndex == 4) ...[
            buildAccounts(context),
          ],
        ],
      ),
      // body: tabs[_currentIndex],
    );
  }

  Widget buildChats(context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: greySoftColor,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chat',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Icon(
                    Icons.chat_outlined,
                    color: purpleColor,
                    size: 18,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search chat',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: purpleColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildQrCode(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () async {
            //scan qr and return value

            //ask camera permission
            var status = await Permission.camera.status;
            if (status.isDenied) {
              // We haven't asked for permission yet or the permission has been denied before, but not permanently.
              status = await Permission.camera.request();
            }

            if (status == PermissionStatus.granted) {
              String? cameraScanResult = await scanner.scan();
              if (cameraScanResult != null) {
                setState(() {
                  // qrResult = cameraScanResult;
                });
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Remove background color
            elevation: 0, // Remove shadow
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
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
                      title: 'Kalkulus 1',
                      status: 'Incomplete',
                      date: '22th, Mar 2024',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
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
                      title: 'Kalkulus 2',
                      status: 'Completed',
                      date: '22th, Mar 2024',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Text(
        //   'Result:- $qrResult',
        // ),
      ],
    );
  }

  Widget buildExplore(context) {
    return Container(
      color: whiteColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            color: Colors.blue.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RESNA TRI PANGESTU',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Sekarang kamu ada di ',
                      style: blackTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'semester 6',
                      style: blackTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                ),
                Text(
                  'Kamu bisa lihat progress perkuliahanmu di bawah ini.',
                  style: blackTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16, left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Indeks Prestasi',
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'IP yang di peroleh di semester 5',
                  style: blueTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.only(left: 4, top: 4),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(
                            12,
                          ),
                          width: 115,
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'IPS',
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '3.25',
                                style: blackTextStyle.copyWith(
                                  fontSize: 32,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_down_outlined,
                                    color: redColor,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '-0.57',
                                    style: redTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.all(
                            12,
                          ),
                          width: 115,
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'IPK',
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '3.56',
                                style: blackTextStyle.copyWith(
                                  fontSize: 32,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_up_outlined,
                                    color: greenColor,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '-0.57',
                                    style: greenTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.all(
                            12,
                          ),
                          width: 115,
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'IPK Lulus',
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '3.58',
                                style: blackTextStyle.copyWith(
                                  fontSize: 32,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_down_outlined,
                                    color: redColor,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '-0.21',
                                    style: redTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: greySoftColor,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SKS',
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'SKS-mu sampai semester lalu',
                  style: blueTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total SKS telah ditempuh',
                                style: blackTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                'SKS Lulus Minimal 140 SKS',
                                style: blueTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '145',
                            style: blackTextStyle.copyWith(
                              fontSize: 30,
                              fontWeight: semiBold,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: greySoftColor,
                            width: 1,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SKS Lulus',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '143',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SKS Mengulang',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '2',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perbandingan Nilai',
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Nilai yang kamu peroleh sampai sekarang',
                  style: blueTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBarO(
                    groupList: ordinalGroup,
                    domainAxis: DomainAxis(
                      ordinalViewport: OrdinalViewport('1', 4),
                    ),
                    measureAxis: const MeasureAxis(
                      numericViewport: NumericViewport(0, 4),
                    ),
                    allowSliding: true,
                    barLabelValue: (group, ordinalData, index) {
                      return ordinalData.measure.toString();
                    },
                    animate: true,
                    animationDuration: const Duration(milliseconds: 300),
                    fillColor: (group, ordinalData, index) {
                      if (ordinalData.measure > 0) return blueSoftColor;
                      return blueSoftColor;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAccounts(context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
        top: 10,
        bottom: 16,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
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
                width: 8,
              ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/manage-profile');
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        // color: purpleColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: purpleColor,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/manage-account');
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.system_security_update_warning_outlined,
                        color: purpleColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        'Manage Account',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: purpleColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.health_and_safety_outlined,
                      color: purpleColor,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      'User Guide',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.navigate_next,
                      color: purpleColor,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login-page');
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: purpleColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        'Log Out',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: purpleColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
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
                'Good Morning',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                'IBU ELLY ',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          // const Spacer(),
          // Row(
          //   children: [
          //     // Container(
          //     //   width: 24,
          //     //   height: 24,
          //     //   decoration: const BoxDecoration(
          //     //     shape: BoxShape.rectangle,
          //     //     image: DecorationImage(
          //     //       image: AssetImage(
          //     //         'assets/img_profile.png',
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //     // const SizedBox(
          //     //   width: 16,
          //     // ),
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.pushNamed(context, '/notification-mahasiswa');
          //       },
          //       child: Container(
          //         width: 24,
          //         height: 24,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.rectangle,
          //           color: purpleColor,
          //           borderRadius: BorderRadius.circular(4.0),
          //         ),
          //         child: Icon(
          //           Icons.notifications_none,
          //           color: whiteColor,
          //           size: 18,
          //         ),
          //       ),
          //     ),
          //     // const SizedBox(
          //     //   width: 16,
          //     // ),
          //     // Container(
          //     //   width: 24,
          //     //   height: 24,
          //     //   decoration: BoxDecoration(
          //     //     shape: BoxShape.rectangle,
          //     //     color: greenColor,
          //     //     borderRadius: BorderRadius.circular(4.0),
          //     //   ),
          //     //   child: Icon(
          //     //     Icons.qr_code_scanner,
          //     //     color: whiteColor,
          //     //     size: 18,
          //     //   ),
          //     // ),
          //   ],
          // ),
          // const SizedBox(
          //   width: 16,
          // ),
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/my-schedule');
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
                    Icons.calendar_today_outlined,
                    color: whiteColor,
                    size: 14,
                  ),
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
                const Spacer(flex: 1),
                Container(
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
                const Spacer(flex: 1),
                Container(
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
                const Spacer(flex: 1),
                Container(
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
                const Spacer(flex: 1),
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
                const Spacer(flex: 1),
                Container(
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 8,
                //     vertical: 30,
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     color: greySoftColor,
                //   ),
                //   child: Column(
                //     children: [
                //       Text(
                //         '26th',
                //         style: greyDarkTextStyle.copyWith(
                //           fontSize: 16,
                //           fontWeight: semiBold,
                //         ),
                //       ),
                //       Text(
                //         'Oct',
                //         style: greyTextStyle.copyWith(
                //           fontSize: 14,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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

  // Widget buildToDo(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 24),
  //     decoration: BoxDecoration(
  //       color: whiteColor,
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Container(
  //                       width: 24,
  //                       height: 24,
  //                       decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         color: redColor,
  //                       ),
  //                       child: Center(
  //                         child: Text(
  //                           '1',
  //                           style: whiteTextStyle.copyWith(
  //                             fontSize: 12,
  //                             fontWeight: medium,
  //                             color: whiteColor,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       width: 4,
  //                     ),
  //                     Text(
  //                       'My To-Do',
  //                       style: blackTextStyle.copyWith(
  //                         fontSize: 16,
  //                         fontWeight: semiBold,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   height: 4,
  //                 ),
  //                 Text(
  //                   'This is your personal to-do list',
  //                   style: greyTextStyle.copyWith(
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             CustomButtonOutline(
  //               title: 'All To-Do',
  //               onTap: () {
  //                 Navigator.pushNamed(context, '/todo');
  //               },
  //             )
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 8,
  //         ),
  //         Container(
  //           padding: const EdgeInsets.all(
  //             16,
  //           ),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(16),
  //             color: whiteColor,
  //             boxShadow: const [
  //               BoxShadow(
  //                 color: Colors.grey,
  //                 blurRadius: 5.0,
  //               ),
  //             ],
  //           ),
  //           child: Column(
  //             children: [
  //               HomeToDo(
  //                 title: 'Final Quiz',
  //                 status: 'Incomplete',
  //                 date: '22th, Mar 2024',
  //                 onTap: () {},
  //               ),
  //               HomeToDo(
  //                 title: 'Semester Exam',
  //                 status: 'Completed',
  //                 date: '23th, Feb 2024',
  //                 onTap: () {},
  //               )
  //             ],
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 24,
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget buildAcademy(context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 24),
      // decoration: BoxDecoration(
      //   color: whiteColor,
      // ),
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
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeAcademyItem(
                iconUrl: 'assets/ic_beasiswa1.png',
                title: 'Beasiswa',
                color: const Color(0xffFFF1D3),
                onTap: () {
                  Navigator.pushNamed(context, '/card-mahasiswa');
                },
              ),
              HomeAcademyItem(
                iconUrl: 'assets/ic_keuangan.png',
                title: 'Diskon',
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
                iconUrl: 'assets/ic_transkrip.png',
                title: 'Transkrip',
                color: const Color(0xffEBDBD8),
                onTap: () {
                  Navigator.pushNamed(context, '/transcript');
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          // HomeAcademyItem(
          //   iconUrl: 'assets/ic_kemajuan.png',
          //   title: 'Kemajuan\nBelajar',
          //   color: const Color(0xffE4F1F4),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/learning-progress');
          //   },
          // ),
          // HomeAcademyItem(
          //   iconUrl: 'assets/ic_bimbingan.png',
          //   title: 'Bimbingan\nTugas Akhir',
          //   color: const Color(0xffFFEDBD),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/thesis');
          //   },
          // ),
          // HomeAcademyItem(
          //   iconUrl: 'assets/ic_konsultasi.png',
          //   title: 'Konsultasi\nDosen',
          //   color: const Color(0xffC1FBE4),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/lecturer-consultation');
          //   },
          // ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 12,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     HomeAcademyItem(
          //       iconUrl: 'assets/ic_input_krs.png',
          //       title: 'Pengisian\nKRS',
          //       color: const Color(0xffE2E3E4),
          //       onTap: () {
          //         Navigator.pushNamed(context, '/input-krs');
          //       },
          //     ),
          //   ],
          // )
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
              top: 12,
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
