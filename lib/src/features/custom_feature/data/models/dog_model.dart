import 'package:core/core.dart';
import '../../domain/entities/dog.dart';

class DogModel extends Dog {
  DogModel(
    super.name,
    super.breed,
    super.age,
  );

  factory DogModel.fromJson(Json json) {
    return DogModel(
      json['name'] ?? '',
      json['breed'] ?? '',
      json['age'] ?? 0,
    );
  }
}
