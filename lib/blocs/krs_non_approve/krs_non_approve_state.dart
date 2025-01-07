part of 'krs_non_approve_bloc.dart';

sealed class KrsNonApproveState extends Equatable {
  const KrsNonApproveState();

  @override
  List<Object> get props => [];
}

final class KrsNonApproveInitial extends KrsNonApproveState {}

final class KrsNonApproveLoading extends KrsNonApproveState {}

final class KrsNonApproveFailed extends KrsNonApproveState {
  final String e;
  const KrsNonApproveFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class KrsNonApproveSuccess extends KrsNonApproveState {
  final List<KrsNonApproveModel> krs;

  const KrsNonApproveSuccess(this.krs);

  @override
  List<Object> get props => [krs];
}
