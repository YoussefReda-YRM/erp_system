import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                AssetsData.getStartedImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Let\'s Get\nStarted',
            textAlign: TextAlign.center,
            style: Styles.font32LightGreyBold(context),
          ),
          const SizedBox(
            height: 72,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextButton(
              buttonText: "Login",
              textStyle: Styles.font18DarkBlueBold(context),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLoginView);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextButton(
              buttonText: "Register",
              textStyle: Styles.font18DarkBlueBold(context),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSignupView);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 200,
              height: 17,
              child: Text(
                'Continue as a guest',
                textAlign: TextAlign.center,
                style: Styles.font14LightGreyRegular(context),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
