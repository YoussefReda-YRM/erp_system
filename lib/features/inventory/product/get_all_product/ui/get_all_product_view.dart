import 'package:erp_system/core/widgets/drawer_widget.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/add_product_view.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/get_all_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_state.dart';

class GetAllProductView extends StatelessWidget {
  GetAllProductView({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductCubit, GetAllProductState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          drawer: const DrawerWidget(),
          body: GetAllProductViewBody(
            scaffoldKey: scaffoldKey,
          ),
          floatingActionButton: AddProductView(ctxt: context,),
        );
      },
    );
  }
}
