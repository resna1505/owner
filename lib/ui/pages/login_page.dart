import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/blocs/auth/auth_bloc.dart';
import 'package:kampus/models/sign_in_form_model.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';
import 'package:kampus/ui/widgets/forms.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthFailed) {
            // showCustomSnackbar(context, state.e);
            // showSnackbar(context, 'Error',
            //     'Maaf Sesi sudah habis silahkan Login Ulang', 'error');
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home-page-mahasiswa', (route) => false);
            AnimatedSnackBar.rectangle(
              'Success',
              'Selamat datang, login sukses!',
              type: AnimatedSnackBarType.success,
              brightness: Brightness.light,
            ).show(
              context,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
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
                              'Owner Apps | Batam University',
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
                    CustomFormField(
                      title: 'Username',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Note : Password Input
                    CustomFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // Row(
                    //   children: [
                    //     const Spacer(),
                    //     const SizedBox(
                    //       height: 8,
                    //     ),
                    //     Column(
                    //       children: [
                    //         Text(
                    //           'Forgot Password',
                    //           style: redTextStyle.copyWith(
                    //             fontWeight: semiBold,
                    //             fontSize: 14,
                    //           ),
                    //         )
                    //       ],
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Log In',
                      width: double.infinity,
                      onPressed: () {
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, '/home-page-mahasiswa', (route) => false);
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  SignInFormModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        } else {
                          showSnackbar(context, 'Error',
                              'Semua Field harus di isi', 'error');
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
