import 'package:country_explorer/core/error/full_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failure.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Parameters> {
  Future<Either<Failure, Type>> call(Parameters params);
}

class NoParameters extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}