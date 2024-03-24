import 'package:flutter/material.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';
import 'package:kampus/ui/widgets/forms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        children: [
          Container(
            height: 350,
            padding: const EdgeInsets.only(right: 24),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/img_login.png',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 228,
                ),
                Text(
                  'Online education in\nyour hand',
                  style: blackTextStyle.copyWith(
                    fontSize: 21,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(
                        right: 10,
                        left: 155,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: blueDarkColor,
                      ),
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: blueSoftColor,
                      ),
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: blueSoftColor,
                      ),
                    ),
                  ],
                )
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
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi!,',
                          style: blackTextStyle.copyWith(
                            fontSize: 21,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome ',
                              style: blackTextStyle.copyWith(
                                fontSize: 21,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Icon(
                              Icons.waving_hand,
                              color: Colors.yellow.shade500,
                              size: 23,
                            ),
                          ],
                        ),
                        Text(
                          'Student Apps | Batam University',
                          style: greyTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                // Note : Email Input
                const CustomFormField(
                  title: 'Email',
                ),
                const SizedBox(
                  height: 16,
                ),
                // Note : Password Input
                const CustomFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Spacer(),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Text(
                          'Forgot Password',
                          style: redTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Log In',
                  width: 300,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home-page-mahasiswa', (route) => false);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
