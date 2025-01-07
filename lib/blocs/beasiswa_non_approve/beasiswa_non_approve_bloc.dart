import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/beasiswa_non_approve_model.dart';
import 'package:kampus/services/beasiswa_non_approve_service.dart';

part 'beasiswa_non_approve_event.dart';
part 'beasiswa_non_approve_state.dart';

class BeasiswaNonApproveBloc
    extends Bloc<BeasiswaNonApproveEvent, BeasiswaNonApproveState> {
  BeasiswaNonApproveBloc() : super(BeasiswaNonApproveInitial()) {
    on<BeasiswaNonApproveEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is BeasiswaNonApproveGet) {
        try {
          emit(BeasiswaNonApproveLoading());

          final beasiswa =
              await BeasiswaNonApproveService().getBeasiswaNonApprove();
          emit(BeasiswaNonApproveSuccess(beasiswa));
        } catch (e) {
          emit(BeasiswaNonApproveFailed(e.toString()));
        }
      }
    });
  }
}
