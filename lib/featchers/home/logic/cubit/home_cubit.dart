
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';
import 'package:ttech_attendance/featchers/home/data/repo/header_repo.dart';

import '../../../../core/helpers/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HeaderRepo headerRepo;
  HomeCubit(this.headerRepo, ) : super(const HomeState.initial());
  final formKey = GlobalKey<FormState>();
  HeaderData data = HeaderData();
 // final WebSocketChannel channel;

  // void _startListening() {
  //   channel.stream.listen((data) {
  //     final decodedData = jsonDecode(data);
  //     final List<HeaderResponse> dataList = (decodedData as List).map((item) => HeaderResponse.fromJson(item)).toList();
  //     emit(HomeState.success(dataList));
  //   });
  // }

  void emitHomeState(String token) async {
    emit(const HomeState.loading());
    final response = await headerRepo.getHeader(token);
    
    response.when(

      success: (headerRespons) async {
        
        emit(HomeState.success(headerRespons));
      },
      failure: (error) async {

        emit(HomeState.error(error: Intl.defaultLocale== english?error.apiErrorModel.errorMessageEn!: error.apiErrorModel.errorMessageAr!));
      },
    );
  }
}
