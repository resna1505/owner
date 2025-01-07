part of 'beasiswa_approve_bloc.dart';

sealed class BeasiswaApproveState extends Equatable {
  const BeasiswaApproveState();

  @override
  List<Object> get props => [];
}

final class BeasiswaApproveInitial extends BeasiswaApproveState {}

final class BeasiswaApproveLoading extends BeasiswaApproveState {}

final class BeasiswaApproveFailed extends BeasiswaApproveState {
  final String e;
  const BeasiswaApproveFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class BeasiswaApproveSuccess extends BeasiswaApproveState {
  final List<BeasiswaApproveModel> beasiswaApprove;

  const BeasiswaApproveSuccess(this.beasiswaApprove);

  @override
  List<Object> get props => [beasiswaApprove];
}
