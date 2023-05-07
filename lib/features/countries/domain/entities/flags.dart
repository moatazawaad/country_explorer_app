import 'package:equatable/equatable.dart';

class Flags extends Equatable{
 final String png;
 final String svg;
 final String? alt;

 const Flags({required this.png, required this.svg, this.alt});

  @override
  // TODO: implement props
  List<Object?> get props => [png,svg, alt];

}