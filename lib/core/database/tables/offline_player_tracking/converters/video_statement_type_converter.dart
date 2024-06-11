import 'package:drift/drift.dart';

import '../../../../../domain/enums/types.dart';


class VideoStatementTypeConverter extends TypeConverter<PlayerEvent, String> {
  const VideoStatementTypeConverter();

  @override
  PlayerEvent fromSql(String fromDb) {
    return PlayerEvent.fromName(fromDb);
  }

  @override
  String toSql(PlayerEvent value) {
    return value.name;
  }
}
