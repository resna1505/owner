part of 'keuangan_akademik_bloc.dart';

sealed class KeuanganAkademikEvent extends Equatable {
  const KeuanganAkademikEvent();

  @override
  List<Object> get props => [];
}

class KeuanganAkademikGet extends KeuanganAkademikEvent {}
