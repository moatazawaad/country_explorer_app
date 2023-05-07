import 'package:equatable/equatable.dart';

class PostalCode extends Equatable {
  final String format;
  final String regex;

  const PostalCode({required this.format, required this.regex});

  @override
  // TODO: implement props
  List<Object?> get props => [format, regex];
}