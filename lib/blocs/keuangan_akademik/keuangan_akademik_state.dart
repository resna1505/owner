part of 'keuangan_akademik_bloc.dart';

sealed class KeuanganAkademikState extends Equatable {
  const KeuanganAkademikState();

  @override
  List<Object> get props => [];
}

final class KeuanganAkademikInitial extends KeuanganAkademikState {}

final class KeuanganAkademikLoading extends KeuanganAkademikState {}

final class KeuanganAkademikFailed extends KeuanganAkademikState {
  final String e;
  const KeuanganAkademikFailed(this.e);

  @override
  List<Object> get props => [e];
}

class KeuanganAkademikSuccess extends KeuanganAkademikState {
  final KeuanganAkademikModel keuangan;

  const KeuanganAkademikSuccess(this.keuangan);
}
