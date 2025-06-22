import 'package:flutter/material.dart';
import 'package:kampus/blocs/auth/auth_bloc.dart';
import 'package:kampus/shared/shared_methods.dart';
import 'package:kampus/shared/theme.dart';
import 'package:kampus/ui/widgets/buttons.dart';
import 'package:kampus/ui/widgets/forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageAccount extends StatefulWidget {
  const ManageAccount({super.key});

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  final passwordCurrentController = TextEditingController(text: '');
  final passwordNewController = TextEditingController(text: '');
  bool _isSubmitting = false;

  void _updatePassword() {
    if (_isSubmitting) return;

    if (passwordCurrentController.text.isEmpty) {
      showSnackbar(
          context, 'Error', 'Password lama tidak boleh kosong', 'error');
      return;
    }

    if (passwordNewController.text.isEmpty) {
      showSnackbar(
          context, 'Error', 'Password baru tidak boleh kosong', 'error');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    context.read<AuthBloc>().add(
          AuthUpadatePassword(
            passwordCurrentController.text,
            passwordNewController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.5,
        title: Text(
          'Manage Account',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          return previous.runtimeType != current.runtimeType;
        },
        listener: (context, state) {
          if (state is! AuthLoading && _isSubmitting) {
            setState(() {
              _isSubmitting = false;
            });
          }

          if (state is AuthFailed) {
            showSnackbar(context, 'Error', state.e, 'error');
          }

          if (state is AuthPasswordUpdateSuccess) {
            showSnackbar(context, 'Success', state.message, 'success');
            passwordCurrentController.clear();
            passwordNewController.clear();

            Navigator.pushNamedAndRemoveUntil(
                context, '/login-page', (route) => false);
          }

          if (state is AuthLogoutSuccess) {
            showSnackbar(
                context, 'Success', 'Anda telah berhasil logout', 'success');
            Navigator.pushNamedAndRemoveUntil(
                context, '/login-page', (route) => false);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login-page', (route) => false);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: _isSubmitting,
            child: Opacity(
              opacity: _isSubmitting ? 0.7 : 1.0,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  const SizedBox(height: 18),
                  CustomFormField(
                    title: 'Kata Sandi Lama',
                    obscureText: true,
                    controller: passwordCurrentController,
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    title: 'Kata Sandi Baru',
                    obscureText: true,
                    controller: passwordNewController,
                  ),
                  const SizedBox(height: 30),
                  CustomFilledButton(
                    title: _isSubmitting ? 'Menyimpan...' : 'Simpan',
                    width: 300,
                    onPressed: _isSubmitting ? null : _updatePassword,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    passwordCurrentController.dispose();
    passwordNewController.dispose();
    super.dispose();
  }
}
