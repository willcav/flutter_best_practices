import 'package:core/core.dart';
import '../data/interfaces/i_dogs_datasource.dart';

class DogsDatasource implements IDogsDatasource {
  final Network networkService;

  DogsDatasource(this.networkService);

  @override
  Future<Either<Failure, NetworkResponse>> getDogs() => networkService.get('dogs');
  
  @override
  Future<Either<Failure, NetworkResponse>> getDogsTemplate() => networkService.get('dogs-template');
}