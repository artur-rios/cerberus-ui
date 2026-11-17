// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_list_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileListOutput _$ProfileListOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['items', 'nextCursor']);
  return ProfileListOutput(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => ProfileListItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextCursor: json['nextCursor'] as String?,
  );
}

Map<String, dynamic> _$ProfileListOutputToJson(ProfileListOutput instance) =>
    <String, dynamic>{
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
      'nextCursor': ?instance.nextCursor,
    };
