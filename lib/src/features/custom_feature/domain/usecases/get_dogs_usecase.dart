import 'package:core/core.dart';
import '../entities/dog.dart';
import '../interfaces/i_dogs_repository.dart';

class GetDogsUseCase {
  final IDogsRepository repository;

  GetDogsUseCase(this.repository);

  Future<Either<Failure, List<Dog>>> call() => repository.getDogs();
}