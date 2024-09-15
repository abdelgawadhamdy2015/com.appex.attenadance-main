import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/featchers/departures/data/models/departure_model.dart';
import 'package:ttech_attendance/featchers/departures/data/repo/depatrure_repo.dart';
import 'package:ttech_attendance/featchers/departures/logic/cubit/departure_state.dart';

class DepartureCubit extends Cubit<DepartureState> {
  DepatrureRepo depatrureRepo;
  DepartureCubit(this.depatrureRepo)
      : super(const DepartureState.departureInitial());

  List<DepartureModel> departure = [];

  emitDepartureState() async {
    emit(const DepartureState.departureLoading());
    final response = await depatrureRepo.getDepartures();

    response.when(success: (headerResponse) async {
      emit(DepartureState.departureSuccess(headerResponse));
    }, failure: (error) async {
      emit(DepartureState.departureError(
          error: Intl.defaultLocale == MyConstants.english
              ? error.apiErrorModel.errorMessageEn!
              : error.apiErrorModel.errorMessageAr!));
    });
  }
}
