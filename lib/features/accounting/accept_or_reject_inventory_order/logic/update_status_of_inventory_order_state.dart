abstract class UpdateStatusOfInventoryOrderState {}

class UpdateStatusOfInventoryOrderInitial
    extends UpdateStatusOfInventoryOrderState {}

class UpdateStatusOfInventoryOrderLoading
    extends UpdateStatusOfInventoryOrderState {}

class UpdateStatusOfInventoryOrderSuccess
    extends UpdateStatusOfInventoryOrderState {
  UpdateStatusOfInventoryOrderSuccess();
}

class UpdateStatusOfInventoryOrderFailure
    extends UpdateStatusOfInventoryOrderState {
  final String error;

  UpdateStatusOfInventoryOrderFailure({required this.error});
}
