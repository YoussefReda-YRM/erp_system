import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:flutter/material.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(
          AssetsData.profile,
        ),
      ),
      title: Text(
        getIt.get<LoginResponse>().userData!.userName!,
        maxLines: 1,
        style: Styles.font18LightGreyBold(context),
      ),
      subtitle: Text(
        'inventory employee',
        style: Styles.font14LightGreyRegular(context),
      ),
      onTap: () {},
    );
  }
}
