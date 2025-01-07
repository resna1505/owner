import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/beasiswa_approve_model.dart';
import 'package:kampus/services/beasiswa_approve_service.dart';

part 'beasiswa_approve_event.dart';
part 'beasiswa_approve_state.dart';

class BeasiswaApproveBloc
    extends Bloc<BeasiswaApproveEvent, BeasiswaApproveState> {
  BeasiswaApproveBloc() : super(BeasiswaApproveInitial()) {
    on<BeasiswaApproveEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is BeasiswaApproveGet) {
        try {
          emit(BeasiswaApproveLoading());

          final beasiswa = await BeasiswaApproveService().getBeasiswaApprove();
          emit(BeasiswaApproveSuccess(beasiswa));
        } catch (e) {
          emit(BeasiswaApproveFailed(e.toString()));
        }
      }
    });
  }
}
