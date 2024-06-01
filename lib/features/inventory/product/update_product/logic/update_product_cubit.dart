import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/product/update_product/data/models/update_product_request_body.dart';
import 'package:erp_system/features/inventory/product/update_product/data/repos/update_product_repo.dart';
import 'package:erp_system/features/inventory/product/update_product/logic/update_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  final UpdateProductRepo _updateProductRepo;
  UpdateProductCubit(this._updateProductRepo) : super(UpdateProductInitial());

  TextEditingController productNameController = TextEditingController();
  TextEditingController productOnHandController = TextEditingController();
  TextEditingController productBarcodeController = TextEditingController();
  TextEditingController productInComingController = TextEditingController();
  TextEditingController productOutGoingController = TextEditingController();
  TextEditingController productSellPriceController = TextEditingController();
  TextEditingController productCostPriceController = TextEditingController();
  TextEditingController activeOrderController = TextEditingController();
  TextEditingController subCategoryIdController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updateProduct(int productId) async {
    emit(UpdateProductLoading());
    final response = await _updateProductRepo.updateProduct(
      UpdateProductRequestBody(
        productName: productNameController.text,
        productOnHand: int.parse(productOnHandController.text),
        productBarcode:
            'new product', //int.parse(productBarcodeController.text),
        productInComing: int.parse(productInComingController.text),
        productOutGoing: int.parse(productOutGoingController.text),
        productSellPrice: int.parse(productSellPriceController.text),
        productCostPrice: int.parse(productCostPriceController.text),
        activeOrder: 0, //int.parse(activeOrderController.text),
        addedBy: getIt.get<LoginResponse>().userData!.userID.toString(),
        subCategoryId: int.parse(subCategoryIdController.text),
      ),
      productId,
    );

    response.when(
      success: (updateProductResponse) {
        emit(UpdateProductSuccess(updateProductResponse));
      },
      failure: (error) {
        emit(UpdateProductFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}