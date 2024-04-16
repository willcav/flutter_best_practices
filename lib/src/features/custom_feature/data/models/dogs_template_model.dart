import 'package:core/core.dart';
import '../../domain/entities/dog_template.dart';

class DogsTemplateModel extends DogsTemplate {
  DogsTemplateModel(super.mainSection, super.secondarySection,);

  factory DogsTemplateModel.fromJson(Json json) {
    return DogsTemplateModel(
      DogsSectionModel.fromJson(json['mainSection'] ?? {}),
      DogsSectionModel.fromJson(json['secondarySection'] ?? {}),
    );
  }
}

class DogsSectionModel extends DogsSection {
  DogsSectionModel(super.title, super.subtitle,);

  factory DogsSectionModel.fromJson(Json json) {
    return DogsSectionModel(
      json['title'] ?? '',
      json['subtitle'] ?? '',
    );
  }
}