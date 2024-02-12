import 'package:erp_system/core/helpers/app_regex.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/cusotm_app_bar.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/auth/body_text.dart';
import 'package:erp_system/features/auth/head_text.dart';
import 'package:erp_system/features/auth/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordViewBody extends StatefulWidget {
  const CreateNewPasswordViewBody({super.key});

  @override
  State<CreateNewPasswordViewBody> createState() => _CreateNewPasswordViewBodyState();
}

class _CreateNewPasswordViewBodyState extends State<CreateNewPasswordViewBody> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),
        const HeadText(text: "Create new password"),
        const BodyText(
            text:
                "Your new password must be unique from those previously used."),
        const SizedBox(
          height: 20,
        ),
        AppTextFormField(
          controller:context.read<LoginCubit>().passwordController,
          hintText: "New Password",
          prefixIcon: const Icon(
            Icons.lock_outline,
            size: 22,
            color: ColorsApp.primaryColor,
          ),
          isObscureText: isObscureText,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                size: 15,
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
        ),
        AppTextFormField(
          controller:context.read<LoginCubit>().passwordController,
          hintText: "Confirm Password",
          prefixIcon: const Icon(
            Icons.lock_outline,
            size: 22,
            color: ColorsApp.primaryColor,
          ),
          isObscureText: isObscureText,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                size: 15,
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
        ),
        const SizedBox(
          height: 30,
        ),
        AppTextButton(
          buttonText: "Reset Password",
          textStyle: Styles.font16LightGreyMedium(context),
          onPressed: () {
            GoRouter.of(context)
                .pushReplacement(AppRouter.kPasswordChangedView);
          },
        ),
      ],
    );
  }
}
