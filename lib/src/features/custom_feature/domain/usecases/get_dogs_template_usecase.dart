import 'package:core/core.dart';
import '../entities/dog_template.dart';
import '../interfaces/i_dogs_repository.dart';

class GetDogsTemplateUsecase {
  final IDogsRepository repository;

  GetDogsTemplateUsecase(this.repository);

  Future<Either<Failure, DogsTemplate>> call() async {
    return repository.getDogsTemplate();
  }
}