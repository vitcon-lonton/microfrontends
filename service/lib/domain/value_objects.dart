import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  // factory EmailAddress(String input) {
  //   return EmailAddress._(
  //     validateEmailAddress(input),
  //   );
  // }

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateStringNotEmpty(input).flatMap(validateEmailAddress),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  static const minLength = 8;
  static const maxLength = 15;

  @override
  final Either<ValueFailure<String>, String> value;

  // factory Password(String input) {
  //   return Password._(
  //     validatePassword(input),
  //   );
  // }

  factory Password(String input) {
    return Password._(
      validateStringNotEmpty(input)
          .flatMap((value) => validateMinStringLength(input, minLength))
          .flatMap(validatePassword),
    );
  }

  const Password._(this.value);
}

class Phone extends ValueObject<String> {
  static const minLength = 0;
  static const maxLength = 15;

  @override
  final Either<ValueFailure<String>, String> value;

  factory Phone(String input) {
    return Phone._(
      validateStringNotEmpty(input)
          .flatMap(validateSingleLine)
          .flatMap((value) => validateMinStringLength(input, minLength))
          .flatMap((value) => validateMaxStringLength(input, maxLength))
          .flatMap(validateIsNumeric),
    );
  }

  const Phone._(this.value);
}

class Name extends ValueObject<String> {
  static const maxLength = 15;

  @override
  final Either<ValueFailure<String>, String> value;

  factory Name(String input) {
    return Name._(
      validateStringNotEmpty(input)
          .flatMap(validateSingleLine)
          .flatMap((v) => validateMaxStringLength(input, maxLength)),
    );
  }

  const Name._(this.value);
}

class FullName extends ValueObject<String> {
  static const maxLength = 100;

  @override
  final Either<ValueFailure<String>, String> value;

  factory FullName(String input) {
    return FullName._(
      validateStringNotEmpty(input)
          .flatMap(validateSingleLine)
          .flatMap((value) => validateMaxStringLength(input, maxLength)),
    );
  }

  const FullName._(this.value);
}

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

class ZipCode extends ValueObject<String> {
  static const maxLength = 10;
  static const minLength = 5;

  @override
  final Either<ValueFailure<String>, String> value;

  factory ZipCode(String input) {
    return ZipCode._(
      validateStringNotEmpty(input)
          .flatMap(validateSingleLine)
          .flatMap((value) => validateMaxStringLength(input, maxLength)),
    );
  }

  const ZipCode._(this.value);
}

class CardNumber extends ValueObject<String> {
  static const maxLength = 16;
  static const minLength = 16;

  @override
  final Either<ValueFailure<String>, String> value;

  factory CardNumber(String input) {
    return CardNumber._(
      validateStringNotEmpty(input)
          .flatMap(validateSingleLine)
          .flatMap((v) => validateMinStringLength(input, minLength))
          .flatMap((v) => validateMaxStringLength(input, maxLength)),
    );
  }

  const CardNumber._(this.value);
}

class CVVNumber extends ValueObject<String> {
  static const maxLength = 3;
  static const minLength = 3;

  @override
  final Either<ValueFailure<String>, String> value;

  factory CVVNumber(String input) {
    return CVVNumber._(
      validateStringNotEmpty(input)
          .flatMap(validateSingleLine)
          .flatMap((v) => validateMinStringLength(input, minLength))
          .flatMap((v) => validateMaxStringLength(input, maxLength)),
    );
  }

  const CVVNumber._(this.value);
}
