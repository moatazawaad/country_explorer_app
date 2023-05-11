import 'package:country_explorer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Parameters> {
  Future<Either<Failure, Type>> call(Parameters params);
}

class NoParameters extends Equatable {
  @override
  List<Object?> get props => [];
}