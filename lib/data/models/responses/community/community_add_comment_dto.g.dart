// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_add_comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityAddCommentModelDto _$CommunityAddCommentModelDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'CommunityAddCommentModelDto',
      json,
      ($checkedConvert) {
        final val = CommunityAddCommentModelDto(
          id: $checkedConvert('id', (v) => v as String?),
          message: $checkedConvert('message', (v) => v as String?),
        );
        return val;
      },
    );
