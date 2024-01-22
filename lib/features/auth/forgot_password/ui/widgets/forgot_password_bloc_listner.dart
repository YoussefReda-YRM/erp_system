// import 'package:erp_system/core/utils/app_router.dart';
// import 'package:erp_system/core/utils/colors_app.dart';
// import 'package:erp_system/core/utils/styles.dart';
// import 'package:erp_system/features/auth/forgot_password/logic/forgot_password_cubit.dart';
// import 'package:erp_system/features/auth/forgot_password/logic/forgot_password_state.dart';
// import 'package:erp_system/features/auth/login/logic/login_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class ForgotPasswordBlocListener extends StatelessWidget {
//   const ForgotPasswordBlocListener({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
//       listener: (context, state) {
//         if (state is LoginLoading) {
//           showDialog(
//             context: context,
//             builder: (context) => const Center(
//               child: CircularProgressIndicator(
//                 color: ColorsApp.lightGrey,
//               ),
//             ),
//           );
//         } else if (state is LoginSuccess) {
//           GoRouter.of(context).pop();
//           GoRouter.of(context).push(AppRouter.kHomeView);//TODO change the router
//         } else if (state is ForgotPasswrodFailure){
//           setupErrorState(context, state.error.toString());
//         }
//       },
//       child: const SizedBox.shrink(),
//     );
//   }

//   void setupErrorState(BuildContext context, String error) {
//     GoRouter.of(context).pop();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         icon: const Icon(
//           Icons.error,
//           color: Colors.red,
//           size: 32,
//         ),
//         content: Text(
//           error,
//           style: Styles.font15DarkBlueMedium,
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               GoRouter.of(context).pop();
//             },
//             child: Text(
//               "Got it",
//               style: Styles.font14BlueSemiBold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
