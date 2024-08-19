import 'package:bloc/bloc.dart';
import 'package:ttech_attendance/featchers/permission/data/models/shift_model.dart';
import 'package:ttech_attendance/featchers/permission/data/repo/permission_repo.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  final PermissionRepo permissionRepo;
  PermissionCubit({required this.permissionRepo}) : super(const PermissionState.initial());
  List<ShiftModel> shiftChecks = [];
}
