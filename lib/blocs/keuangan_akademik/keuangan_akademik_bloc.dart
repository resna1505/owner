import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/keuangan_akademik_model.dart';
import 'package:kampus/services/keuangan_akademik_service.dart';

part 'keuangan_akademik_event.dart';
part 'keuangan_akademik_state.dart';

class KeuanganAkademikBloc
    extends Bloc<KeuanganAkademikEvent, KeuanganAkademikState> {
  KeuanganAkademikBloc() : super(KeuanganAkademikInitial()) {
    on<KeuanganAkademikEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is KeuanganAkademikGet) {
        try {
          emit(KeuanganAkademikLoading());

          final keuangan =
              await KeuanganAkademikService().getKeuanganAkademik();
          emit(KeuanganAkademikSuccess(keuangan));
        } catch (e) {
          emit(KeuanganAkademikFailed(e.toString()));
        }
      }
    });
  }
}
