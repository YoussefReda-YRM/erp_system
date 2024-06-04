import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:erp_system/features/scm/get_all_status_of_scm_order/logic/get_all_scm_order_status_cubit.dart';
import 'package:erp_system/features/scm/get_all_status_of_scm_order/logic/get_all_scm_order_status_state.dart';
import 'package:erp_system/features/scm/get_all_status_of_scm_order/ui/widgets/scm_order_status_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllStatusOfScmViewBody extends StatelessWidget {
  const GetAllStatusOfScmViewBody({
    super.key,
    required this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          scaffoldKey: scaffoldKey,
          title: 'Order\'s Status',
          iconLeading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        Expanded(
            child: CustomAppBody(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: BlocBuilder<GetAllScmOrderStatusCubit,
                    GetAllScmOrderStatusState>(
                  builder: (context, state) {
                    if (state is GetAllScmOrderStatusLoading) {
                      return const CustomCircularProgressIndicator();
                    } else if (state is GetAllScmOrderStatusSuccess) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.response.length,
                        itemBuilder: (context, index) {
                          return ScmOrderStatusItem(
                            data: state.response[index],
                          );
                        },
                      );
                    } else if (state is GetAllScmOrderStatusFailure) {
                      return CustomErrorWidget(error: state.error);
                    } else {
                      return const CustomNoProductWidget();
                    }
                  },
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
