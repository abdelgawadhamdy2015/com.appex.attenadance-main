import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/all_vaccations_model.dart';
import 'package:ttech_attendance/featchers/request_form/date/repo/all_vaccations_repo.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/all_vaccations_state.dart';

class AllVaccationsCubit extends Cubit<AllVaccationsState> {
  final AllVaccationsRepo allVaccationsRepo;
  AllVaccationsCubit(this.allVaccationsRepo)
      : super(const AllVaccationsState.initial());

  final formKey = GlobalKey<FormState>();
  List<Data> vaccations = [];
  List<String> vacctionsName = [];
  List<int> vacctionsIds = [];

  void emitAllVaccationsState( ) async {
    emit(const AllVaccationsState.loading());
    final response = await allVaccationsRepo.getVaccations();

    response.when(success: (allVaccationsModel) async {
      emit(AllVaccationsState.success(allVaccationsModel));
    }, failure: (error) {
      emit(AllVaccationsState.error(error: Intl.defaultLocale==MyConstants.english? error.apiErrorModel.errorMessageEn!: error.apiErrorModel.errorMessageAr!));
    });
  }
}
