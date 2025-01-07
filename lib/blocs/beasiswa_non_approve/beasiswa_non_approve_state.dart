part of 'beasiswa_non_approve_bloc.dart';

sealed class BeasiswaNonApproveState extends Equatable {
  const BeasiswaNonApproveState();

  @override
  List<Object> get props => [];
}

final class BeasiswaNonApproveInitial extends BeasiswaNonApproveState {}

final class BeasiswaNonApproveLoading extends BeasiswaNonApproveState {}

final class BeasiswaNonApproveFailed extends BeasiswaNonApproveState {
  final String e;
  const BeasiswaNonApproveFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class BeasiswaNonApproveSuccess extends BeasiswaNonApproveState {
  final List<BeasiswaNonApproveModel> beasiswaNon;

  const BeasiswaNonApproveSuccess(this.beasiswaNon);

  @override
  List<Object> get props => [beasiswaNon];
}
