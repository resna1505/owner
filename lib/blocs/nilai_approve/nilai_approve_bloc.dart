import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/nilai_approve_model.dart';
import 'package:kampus/services/nilai_approve_service.dart';

part 'nilai_approve_event.dart';
part 'nilai_approve_state.dart';

class NilaiApproveBloc extends Bloc<NilaiApproveEvent, NilaiApproveState> {
  NilaiApproveBloc() : super(NilaiApproveInitial()) {
    on<NilaiApproveEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is NilaiApproveGet) {
        try {
          emit(NilaiApproveLoading());

          final krs = await NilaiApproveService().getNilaiApprove();
          emit(NilaiApproveSuccess(krs));
        } catch (e) {
          emit(NilaiApproveFailed(e.toString()));
        }
      }
    });
  }
}
