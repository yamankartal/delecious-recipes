import 'package:dartz/dartz.dart';

import '../../../failures/failures.dart';

abstract class AppRepository {
  Either<Failure, bool> isDarkTheme();

  Either<Failure, Unit> changeTheme();
}
