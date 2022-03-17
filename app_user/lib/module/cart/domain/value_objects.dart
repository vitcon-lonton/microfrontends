import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:app_user/core/core.dart';

class List6<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 6;

  factory List6(KtList<T> input) {
    return List6._(validateMaxListLength(input, maxLength));
  }

  const List6._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}
