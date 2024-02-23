import 'package:erp_system/features/auth/login/ui/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(role: role),
    );
  }
}
