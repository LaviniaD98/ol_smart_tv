import 'package:equatable/equatable.dart';

class PostLinkModel extends Equatable {
  const PostLinkModel({
    required this.url,
    required this.label,
    this.imageUrl,
  });

  final String url;
  final String label;
  final String? imageUrl;

  @override
  List<Object?> get props => [
    url,
    label,
    imageUrl,
  ];
}
