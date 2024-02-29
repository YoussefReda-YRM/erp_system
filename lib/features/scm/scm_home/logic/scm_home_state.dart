import 'package:erp_system/features/scm/scm_home/data/models/scm_home_model.dart';

abstract class ScmHomeState {}

class ScmHomeInitial extends ScmHomeState {}

class ScmHomeLoading extends ScmHomeState {}

class ScmHomeFailure extends ScmHomeState {
  final String error;

  ScmHomeFailure({required this.error});
}

class ScmHomeSuccess extends ScmHomeState {
  final ScmHomeModel response;

  ScmHomeSuccess({
    required this.response,
  });
}
