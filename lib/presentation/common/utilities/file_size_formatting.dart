import 'dart:math';

String getFileSizeString({
  int? bytes,
  int decimals = 2,
}) {
  if (bytes == null) return "N.A.";
  const suffixes = ["b", "Kb", "Mb", "Gb", "Tb"];
  if (bytes == 0) return '0${suffixes[0]}';
  var i = (log(bytes) / log(1024)).floor();
  return "${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}";
}
