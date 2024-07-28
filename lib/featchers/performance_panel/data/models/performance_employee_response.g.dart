// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_employee_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformanceEmployeeResponse _$PerformanceEmployeeResponseFromJson(
        Map<String, dynamic> json) =>
    PerformanceEmployeeResponse(
      result: (json['result'] as num?)?.toInt(),
      dataCount: (json['dataCount'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      alart: (json['alart'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      code: (json['code'] as num?)?.toInt(),
      note: json['note'] as String?,
      totalCount: (json['totalCount'] as num?)?.toInt(),
      errorMessageAr: json['errorMessageAr'] as String?,
      errorMessageEn: json['errorMessageEn'] as String?,
      total: (json['total'] as num?)?.toInt(),
      dateTimeNow: json['dateTimeNow'] as String?,
      updateNumber: (json['updateNumber'] as num?)?.toInt(),
      isUpdate: (json['isUpdate'] as num?)?.toInt(),
      isPrint: json['isPrint'] as bool?,
      permissionListId: (json['permissionListId'] as num?)?.toInt(),
      employyeNameAr: json['employyeNameAr'] as String?,
      employyeNameEn: json['employyeNameEn'] as String?,
      posPrintFilesAr: json['posPrintFilesAr'] as String?,
      posPrintFilesEn: json['posPrintFilesEn'] as String?,
      returnPosPrintFilesAr: json['returnPosPrintFilesAr'] as String?,
      returnPosPrintFilesEn: json['returnPosPrintFilesEn'] as String?,
      isAuthorizedOnDashboardData: json['isAuthorizedOnDashboardData'] as bool?,
    );

Map<String, dynamic> _$PerformanceEmployeeResponseToJson(
        PerformanceEmployeeResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'dataCount': instance.dataCount,
      'data': instance.data,
      'alart': instance.alart,
      'id': instance.id,
      'code': instance.code,
      'note': instance.note,
      'totalCount': instance.totalCount,
      'errorMessageAr': instance.errorMessageAr,
      'errorMessageEn': instance.errorMessageEn,
      'total': instance.total,
      'dateTimeNow': instance.dateTimeNow,
      'updateNumber': instance.updateNumber,
      'isUpdate': instance.isUpdate,
      'isPrint': instance.isPrint,
      'permissionListId': instance.permissionListId,
      'employyeNameAr': instance.employyeNameAr,
      'employyeNameEn': instance.employyeNameEn,
      'posPrintFilesAr': instance.posPrintFilesAr,
      'posPrintFilesEn': instance.posPrintFilesEn,
      'returnPosPrintFilesAr': instance.returnPosPrintFilesAr,
      'returnPosPrintFilesEn': instance.returnPosPrintFilesEn,
      'isAuthorizedOnDashboardData': instance.isAuthorizedOnDashboardData,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) => Employees.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      arabicName: json['arabicName'] as String?,
      latinName: json['latinName'] as String?,
      expanded: json['expanded'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'employees': instance.employees,
      'id': instance.id,
      'arabicName': instance.arabicName,
      'latinName': instance.latinName,
      'expanded': instance.expanded,
    };

Employees _$EmployeesFromJson(Map<String, dynamic> json) => Employees(
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      branchId: (json['branchId'] as num?)?.toInt(),
      code: (json['code'] as num?)?.toInt(),
      arabicName: json['arabicName'] as String?,
      latinName: json['latinName'] as String?,
      jobAr: json['jobAr'] as String?,
      jobEn: json['jobEn'] as String?,
      shiftAr: json['shiftAr'] as String?,
      shiftEn: json['shiftEn'] as String?,
      expanded: json['expanded'] as bool?,
      totalLateTime: json['totalLateTime'] as String?,
      totalExtraTime: json['totalExtraTime'] as String?,
      totalWorkingTime: json['totalWorkingTime'] as String?,
      totalShiftTime: json['totalShiftTime'] as String?,
    );

Map<String, dynamic> _$EmployeesToJson(Employees instance) => <String, dynamic>{
      'days': instance.days,
      'id': instance.id,
      'branchId': instance.branchId,
      'code': instance.code,
      'arabicName': instance.arabicName,
      'latinName': instance.latinName,
      'jobAr': instance.jobAr,
      'jobEn': instance.jobEn,
      'shiftAr': instance.shiftAr,
      'shiftEn': instance.shiftEn,
      'expanded': instance.expanded,
      'totalLateTime': instance.totalLateTime,
      'totalExtraTime': instance.totalExtraTime,
      'totalWorkingTime': instance.totalWorkingTime,
      'totalShiftTime': instance.totalShiftTime,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      branchId: (json['branchId'] as num?)?.toInt(),
      employeeId: (json['employeeId'] as num?)?.toInt(),
      dayAr: json['dayAr'] as String?,
      dayEn: json['dayEn'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      shift1TimeIn: json['shift1TimeIn'] as String?,
      shift1TimeOut: json['shift1TimeOut'] as String?,
      shift2TimeIn: json['shift2TimeIn'] as String?,
      shift2TimeOut: json['shift2TimeOut'] as String?,
      shift3TimeIn: json['shift3TimeIn'] as String?,
      shift3TimeOut: json['shift3TimeOut'] as String?,
      shift4TimeIn: json['shift4TimeIn'] as String?,
      shift4TimeOut: json['shift4TimeOut'] as String?,
      totalShiftTime: json['totalShiftTime'] as String?,
      lateTime: json['lateTime'] as String?,
      extraTime: json['extraTime'] as String?,
      workingTime: json['workingTime'] as String?,
      status: (json['status'] as num?)?.toInt(),
      statusAr: json['statusAr'] as String?,
      statusEn: json['statusEn'] as String?,
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'branchId': instance.branchId,
      'employeeId': instance.employeeId,
      'dayAr': instance.dayAr,
      'dayEn': instance.dayEn,
      'date': instance.date?.toIso8601String(),
      'shift1TimeIn': instance.shift1TimeIn,
      'shift1TimeOut': instance.shift1TimeOut,
      'shift2TimeIn': instance.shift2TimeIn,
      'shift2TimeOut': instance.shift2TimeOut,
      'shift3TimeIn': instance.shift3TimeIn,
      'shift3TimeOut': instance.shift3TimeOut,
      'shift4TimeIn': instance.shift4TimeIn,
      'shift4TimeOut': instance.shift4TimeOut,
      'totalShiftTime': instance.totalShiftTime,
      'lateTime': instance.lateTime,
      'extraTime': instance.extraTime,
      'workingTime': instance.workingTime,
      'status': instance.status,
      'statusAr': instance.statusAr,
      'statusEn': instance.statusEn,
    };
