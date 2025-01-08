part of 'nilai_non_approve_bloc.dart';

sealed class NilaiNonApproveState extends Equatable {
  const NilaiNonApproveState();

  @override
  List<Object> get props => [];
}

final class NilaiNonApproveInitial extends NilaiNonApproveState {}

final class NilaiNonApproveLoading extends NilaiNonApproveState {}

final class NilaiNonApproveFailed extends NilaiNonApproveState {
  final String e;
  const NilaiNonApproveFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class NilaiNonApproveSuccess extends NilaiNonApproveState {
  final List<NilaiNonApproveModel> nilai;

  const NilaiNonApproveSuccess(this.nilai);

  @override
  List<Object> get props => [nilai];
}
