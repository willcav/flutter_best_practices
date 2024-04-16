import 'package:core/core.dart';
import '../entities/dog.dart';
import '../entities/dog_template.dart';

abstract interface class IDogsRepository {
  Future<Either<Failure, List<Dog>>> getDogs();

  Future<Either<Failure, DogsTemplate>> getDogsTemplate();
}