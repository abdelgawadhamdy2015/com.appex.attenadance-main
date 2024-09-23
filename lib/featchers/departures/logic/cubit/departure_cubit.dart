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

  List<DepartureModel> departures = [
    DepartureModel("1", "pinding", 1, "1-2-2024", "2-2-2024", "10-1-2024"),
    DepartureModel("2", "pinding", 2, "1-2-2024", "2-2-2024", "10-1-2024"),
    DepartureModel("3", "accepted", 1, "1-2-2024", "2-2-2024", "10-1-2024"),
    DepartureModel("4", "refused", 2, "1-2-2024", "2-2-2024", "10-1-2024"),
    DepartureModel("5", "pinding", 1, "1-2-2024", "2-2-2024", "10-1-2024"),
    DepartureModel("6", "accepted", 2, "1-2-2024", "2-2-2024", "10-1-2024"),
    DepartureModel("7", "refused", 2, "1-2-2024", "2-2-2024", "10-1-2024"),
    DepartureModel("8", "refused", 2, "1-2-2024", "2-2-2024", "10-1-2024"),
    DepartureModel("9", "pinding", 2, "1-2-2024", "2-2-2024", "10-1-2024"),
    DepartureModel("10", "refused", 2, "1-2-2024", "2-2-2024", "10-1-2024"),
  ];

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
