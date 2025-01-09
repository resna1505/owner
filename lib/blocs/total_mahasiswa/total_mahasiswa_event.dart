part of 'total_mahasiswa_bloc.dart';

sealed class TotalMahasiswaEvent extends Equatable {
  const TotalMahasiswaEvent();

  @override
  List<Object> get props => [];
}

class TotalMahasiswaGet extends TotalMahasiswaEvent {}
