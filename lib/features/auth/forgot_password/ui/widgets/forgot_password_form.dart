// import 'package:erp_system/core/helpers/app_regex.dart';
// import 'package:erp_system/core/widgets/custom_text_form_field.dart';
// import 'package:erp_system/features/auth/forgot_password/logic/forgot_password_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ForgotPasswordForm extends StatelessWidget {
//   const ForgotPasswordForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: context.read<ForgotPasswordCubit>().formKey,
//       child: Column(
//         children: [
//           AppTextFormField(
//             controller: context.read<ForgotPasswordCubit>().phoneController,
//             hintText: 'Enter your phone',
//             validator: (value) {
//               if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
//                 return 'Please enter a valid phone';
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
