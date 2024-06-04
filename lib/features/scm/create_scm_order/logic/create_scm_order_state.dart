abstract class CreateScmOrderState {}

class CreateScmOrderInitial extends CreateScmOrderState {}

class CreateScmOrderLoading extends CreateScmOrderState {}

class CreateScmOrderFailure extends CreateScmOrderState {
  final String error;

  CreateScmOrderFailure({required this.error});
}

class CreateScmOrderSuccess extends CreateScmOrderState {}
