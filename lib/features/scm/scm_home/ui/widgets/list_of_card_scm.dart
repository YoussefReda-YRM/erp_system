

import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:erp_system/features/scm/scm_home/logic/scm_home_cubit.dart';
import 'package:erp_system/features/scm/scm_home/logic/scm_home_state.dart';
import 'package:erp_system/features/scm/scm_home/ui/widgets/custom_card_scm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfCardScm extends StatelessWidget {
  const ListOfCardScm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomAppBody(
        child: BlocBuilder<ScmHomeCubit, ScmHomeState>(
          builder: (context, state) {
            if (state is ScmHomeLoading) {
              return const CustomCircularProgressIndicator();
            } else if (state is ScmHomeSuccess) {
              return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: GridView.count(
                  padding: const EdgeInsets.only(bottom: 30),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 1,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                  children: [
                    customCardScm(
                      context,
                      'Inventory Orders: ${state.response.inventoryOrderCount}',
                      AssetsData.scm,
                    ),
                    customCardScm(
                      context,
                      'SCM Orders: ${state.response.scmOrderCount}',
                      AssetsData.replensh,
                    ),
                  ],
                ),
              );
            } else if (state is ScmHomeFailure) {
              return CustomErrorWidget(error: state.error.toString());
            } else {
              return const CustomNoProductWidget();
            }
          },
        ),
      ),
    );
  }
}
