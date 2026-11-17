// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'set_collection_membership_output.dart';

part 'set_collection_membership_output_data_output.g.dart';

@JsonSerializable()
class SetCollectionMembershipOutputDataOutput {
  const SetCollectionMembershipOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory SetCollectionMembershipOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$SetCollectionMembershipOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final SetCollectionMembershipOutput? data;

  Map<String, Object?> toJson() =>
      _$SetCollectionMembershipOutputDataOutputToJson(this);
}
