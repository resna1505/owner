part of 'krs_approve_bloc.dart';

sealed class KrsApproveState extends Equatable {
  const KrsApproveState();

  @override
  List<Object> get props => [];
}

final class KrsApproveInitial extends KrsApproveState {}

final class KrsApproveLoading extends KrsApproveState {}

final class KrsApproveFailed extends KrsApproveState {
  final String e;
  const KrsApproveFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class KrsApproveSuccess extends KrsApproveState {
  final List<KrsApproveModel> krs;

  const KrsApproveSuccess(this.krs);

  @override
  List<Object> get props => [krs];
}
