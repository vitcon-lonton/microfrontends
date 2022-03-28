import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';

class RatingContent extends ValueObject<String> {
  static const maxLength = 10;
  // static const maxLength = 200;

  @override
  final Either<ValueFailure<String>, String> value;

  factory RatingContent(String input) {
    return RatingContent._(
      validateSingleLine(input)
          .flatMap((value) => validateMaxStringLength(input, maxLength)),
    );
  }

  const RatingContent._(this.value);
}
