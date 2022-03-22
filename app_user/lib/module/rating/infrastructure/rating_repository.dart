import 'package:dartz/dartz.dart' hide Order;
import 'package:logger/logger.dart';
import '../domain/i_rating_repository.dart';
import '../domain/rating_failure.dart';
import 'api/rating_api.dart';

class RatingRepository implements IRatingRepository {
  final Logger _logger;
  final RatingApi _api;

  RatingRepository(this._logger, this._api);

  @override
  Future<Either<RatingFailure, Unit>> create(
      {required int technicianId, required double point}) {
    try {} catch (e) {
      _logger.e(e);
    }
    throw UnimplementedError();
  }

  @override
  Future<Either<RatingFailure, Unit>> update(
      {required int technicianId, required double point}) {
    try {} catch (e) {
      _logger.e(e);
    }
    throw UnimplementedError();
  }

  @override
  Future<Either<RatingFailure, Unit>> delete(int technicianId) {
    try {} catch (e) {
      _logger.e(e);
    }
    throw UnimplementedError();
  }
}
