import 'package:equatable/equatable.dart';


class NameCommonOfficial extends Equatable {
  final String common;
  final String official;

  const NameCommonOfficial({required this.common, required this.official});

  @override
  // TODO: implement props
  List<Object?> get props => [common, official];
}