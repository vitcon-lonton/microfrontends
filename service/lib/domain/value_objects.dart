import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';

class Street extends ValueObject<String> {
  static const maxLength = 100;

  @override
  final Either<ValueFailure<String>, String> value;

  factory Street(String input) {
    return Street._(
      validateStringNotEmpty(input)
          .flatMap(validateSingleLine)
          .flatMap((value) => validateMaxStringLength(input, maxLength)),
    );
  }

  const Street._(this.value);
}

class Note extends ValueObject<String> {
  static const maxLength = 100;

  @override
  final Either<ValueFailure<String>, String> value;

  factory Note(String input) {
    return Note._(
      validateStringNotEmpty(input)
          .flatMap(validateSingleLine)
          .flatMap((value) => validateMaxStringLength(input, maxLength)),
    );
  }

  const Note._(this.value);
}
