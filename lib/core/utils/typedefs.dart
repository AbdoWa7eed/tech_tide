import 'package:dartz/dartz.dart';

import '../network/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
