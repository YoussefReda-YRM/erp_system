import 'package:erp_system/features/auth/password_changed/password_changed_view_body.dart';
import 'package:flutter/material.dart';

class PasswordChangedView extends StatelessWidget {
  const PasswordChangedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PasswordChangedViewBody(),
    );
  }
}