part of 'nilai_approve_bloc.dart';

sealed class NilaiApproveState extends Equatable {
  const NilaiApproveState();

  @override
  List<Object> get props => [];
}

final class NilaiApproveInitial extends NilaiApproveState {}

final class NilaiApproveLoading extends NilaiApproveState {}

final class NilaiApproveFailed extends NilaiApproveState {
  final String e;
  const NilaiApproveFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class NilaiApproveSuccess extends NilaiApproveState {
  final List<NilaiApproveModel> nilai;

  const NilaiApproveSuccess(this.nilai);

  @override
  List<Object> get props => [nilai];
}
