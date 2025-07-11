// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BasicStatsDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasicStatsDTOImpl _$$BasicStatsDTOImplFromJson(Map<String, dynamic> json) =>
    _$BasicStatsDTOImpl(
      totalExpense: json['total_expense'] as String,
      dateOfLastExpense: json['date_last_expense'] as String,
      remainingBudget: json['remaining_budget'] as String,
    );

Map<String, dynamic> _$$BasicStatsDTOImplToJson(_$BasicStatsDTOImpl instance) =>
    <String, dynamic>{
      'total_expense': instance.totalExpense,
      'date_last_expense': instance.dateOfLastExpense,
      'remaining_budget': instance.remainingBudget,
    };
