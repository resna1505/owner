import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';

class CardMahasiswaPage extends StatelessWidget {
  const CardMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Kartu Tanda Mahasiswa',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 22,
              ),
              Container(
                width: 170,
                height: 170,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/img_qrcode.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Scan QR Code for Attendance',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 24,
              top: 24,
              right: 24,
              bottom: 215,
            ),
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
              width: 340,
              height: 218,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img_card_mahasiswa.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
