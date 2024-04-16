import 'package:core/core.dart';
import '../domain/entities/dog.dart';
import '../domain/entities/dog_template.dart';
import '../domain/interfaces/i_dogs_repository.dart';
import 'interfaces/i_dogs_datasource.dart';
import 'models/dog_model.dart';
import 'models/dogs_template_model.dart';

class DogsRepository implements IDogsRepository {
  final IDogsDatasource dogsDatasource;

  DogsRepository(this.dogsDatasource);

  @override
  Future<Either<Failure, List<Dog>>> getDogs() async {
    final result = await dogsDatasource.getDogs();

    if (result.isLeft) return Left(result.left);

    final dogs = result.right.jsonListData
        .map((json) => DogModel.fromJson(json))
        .toList();

    return Right(dogs);
  }

  @override
  Future<Either<Failure, DogsTemplate>> getDogsTemplate() async {
    final result = await dogsDatasource.getDogsTemplate();

    if (result.isLeft) return Left(result.left);

    return Right(DogsTemplateModel.fromJson(result.right.jsonData));
  }
}
