import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import '../domain/i_rating_repository.dart';
import '../domain/rating_failure.dart';
import '../domain/value_objects.dart';
import 'api/rating_api.dart';

class RatingRepository implements IRatingRepository {
  RatingRepository(this._logger, this._ratingApi);

  final Logger _logger;
  final RatingApi _ratingApi;

  @override
  Future<Either<RatingFailure, Unit>> create(
      {required int technicianId,
      required double point,
      RatingContent? content}) async {
    String? contentStr = content?.getOrCrash();

    try {
      await _ratingApi.create(
          technicianId: technicianId, ratingScore: point, content: contentStr);

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const RatingFailure.unableCreate());
  }

  @override
  Future<Either<RatingFailure, Unit>> update(
      {required int technicianId,
      required double point,
      RatingContent? content}) async {
    String? contentStr = content?.getOrCrash();

    try {
      await _ratingApi.update(
          technicianId: technicianId, ratingScore: point, content: contentStr);

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const RatingFailure.unableUpdate());
  }

  @override
  Future<Either<RatingFailure, Unit>> delete(int technicianId) async {
    try {
      await _ratingApi.delete(technicianId);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const RatingFailure.unableDelete());
  }
}
