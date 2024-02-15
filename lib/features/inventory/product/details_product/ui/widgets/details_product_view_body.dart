import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/product/details_product/logic/details_product_cubit.dart';
import 'package:erp_system/features/inventory/product/details_product/logic/details_product_state.dart';
import 'package:erp_system/features/inventory/product/details_product/ui/widgets/details_product_view_body_items.dart';
import 'package:erp_system/features/inventory/product/details_product/ui/widgets/edit_and_delete_button.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsProductViewBody extends StatelessWidget {
  const DetailsProductViewBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsProductCubit, DetailsProductState>(
      builder: (context, state) {
        if (state is DetailsProductLoading) {
          return const CustomCircularProgressIndicator();
        } else if (state is DetailsProductSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: ColorsApp.primaryColor),
                    ),
                    color: Colors.white,
                    child: SizedBox(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: DetailsProductViewBodyItems(
                            detailsProductModel: state.response,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  EditAndDeleteButton(size: size),
                ],
              ),
            ),
          );
        } else if (state is DetailsProductFailure) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CustomNoProductWidget();
        }
      },
    );
  }
}
