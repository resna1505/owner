part of 'total_mahasiswa_bloc.dart';

sealed class TotalMahasiswaState extends Equatable {
  const TotalMahasiswaState();

  @override
  List<Object> get props => [];
}

final class TotalMahasiswaInitial extends TotalMahasiswaState {}

final class TotalMahasiswaLoading extends TotalMahasiswaState {}

final class TotalMahasiswaFailed extends TotalMahasiswaState {
  final String e;
  const TotalMahasiswaFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TotalMahasiswaSuccess extends TotalMahasiswaState {
  final TotalMahasiswaModel mahasiswa;

  const TotalMahasiswaSuccess(this.mahasiswa);
}
