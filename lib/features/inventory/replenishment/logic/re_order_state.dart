abstract class ReOrderState {}

class ReOrderInitial extends ReOrderState {}

class ReOrderLoading extends ReOrderState {}

class ReOrderFailure extends ReOrderState {
  final String error;

  ReOrderFailure({required this.error});
}

class ReOrderSuccess extends ReOrderState {}
