// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemDetails _$ProblemDetailsFromJson(Map<String, dynamic> json) =>
    ProblemDetails(
      type: json['type'] as String?,
      title: json['title'] as String?,
      status: ProblemDetails._read_status(json['status']),
      detail: json['detail'] as String?,
      instance: json['instance'] as String?,
      additionalProperties:
          ProblemDetails._extras(json, 'additionalProperties') == null
          ? const {}
          : ProblemDetails._readExtras(
              ProblemDetails._extras(json, 'additionalProperties'),
            ),
    );

Map<String, dynamic> _$ProblemDetailsToJson(ProblemDetails instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'title': ?instance.title,
      'status': ?ProblemDetails._write_status(instance.status),
      'detail': ?instance.detail,
      'instance': ?instance.instance,
    };
