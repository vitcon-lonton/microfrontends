import 'package:dartz/dartz.dart';
import 'rating_failure.dart';
import 'value_objects.dart';

abstract class IRatingRepository {
  Future<Either<RatingFailure, Unit>> create(
      {required int technicianId,
      required double point,
      RatingContent? content});
  Future<Either<RatingFailure, Unit>> update(
      {required int technicianId,
      required double point,
      RatingContent? content});
  Future<Either<RatingFailure, Unit>> delete(int technicianId);
}
