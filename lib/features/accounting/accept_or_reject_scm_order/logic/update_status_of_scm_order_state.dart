abstract class UpdateStatusOfScmOrderState {}

class UpdateStatusOfScmOrderInitial extends UpdateStatusOfScmOrderState {}

class UpdateStatusOfScmOrderLoading extends UpdateStatusOfScmOrderState {}

class UpdateStatusOfScmOrderSuccess extends UpdateStatusOfScmOrderState {
  UpdateStatusOfScmOrderSuccess();
}

class UpdateStatusOfScmOrderFailure extends UpdateStatusOfScmOrderState {
  final String error;

  UpdateStatusOfScmOrderFailure({required this.error});
}
