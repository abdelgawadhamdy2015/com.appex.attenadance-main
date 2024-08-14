import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/request_model.dart';
import 'package:ttech_attendance/featchers/request_form/date/repo/request_repo.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/request_vaccation_state.dart';

import '../../../../core/helpers/constants.dart';

class RequestVaccationCubit extends Cubit<RequestVaccationState> {
  final RequestVaccationRepo requestVaccationRepo;
  RequestVaccationCubit(this.requestVaccationRepo)
      : super(const RequestVaccationState.initial());

  final formKey = GlobalKey<FormState>();

  void emitRequestVaccationState(
      RequestVaccation requestVaccation) async {
    emit(const RequestVaccationState.loading());
    final response =
        await requestVaccationRepo.addVaccation(requestVaccation);

    response.when(success: (requestVaccationResponse) async {
      emit(RequestVaccationState.success(requestVaccationResponse));
    }, failure: (error) {
      emit(RequestVaccationState.error(error: Intl.defaultLocale== english?error.apiErrorModel.errorMessageEn!: error.apiErrorModel.errorMessageAr!));
    });
  }

  // void emitAllVaccationsState(String token) async {
  //   emit(const AllVaccationsState.loading());
  //   final response = await allVaccationsRepo.getVaccations(token);

  //   response.when(success: (allVaccationsModel) async {
  //     emit(AllVaccationsState.success(allVaccationsModel));
  //   }, failure: (error) {
  //     emit(AllVaccationsState.error(error: error.apiErrorModel.message));
  //   });
  // }
}
