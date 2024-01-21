import 'package:erp_system/features/auth/otp/ui/widgets/otp_view_body.dart';
import 'package:flutter/material.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OtpViewBody(),
    );
  }
}