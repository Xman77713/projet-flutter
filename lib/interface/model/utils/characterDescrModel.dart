import 'package:flutter_projet_final/interface/model/utils/imageUrlModel.dart';

class ListCharacterDescrModel {
  final List<CharacterDescrModel> listCharacterDescrModel;

  ListCharacterDescrModel(this.listCharacterDescrModel);
}

class CharacterDescrModel {
  final CharacterDModel characterDModel;

  CharacterDescrModel(this.characterDModel);
}

class CharacterDModel {
  final String? name;
  final ImageUrlModel? image;
  final int? id;

  CharacterDModel(this.name, this.id, this.image);

  ImageUrlModel getImageUrl() =>
      ImageUrlModel(image?.mediumUrl, image?.smallUrl);
}
