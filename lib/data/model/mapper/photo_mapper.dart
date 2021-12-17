import 'package:photo_list/domain/model/models.dart';
import 'package:photo_list/presentation/common/constants/image_constants.dart';
import 'package:photo_list/presentation/common/helper/helper.dart';

class PhotoMapper {
  static List<Photo> toList(entity) {
    List<Photo> list = [];
    entity.forEach(
      (e) => list.add(
        Photo(
          imageUrl:
              Helper.validImage(e['src']) ? e['src'] : AllImages().defaultImage,
          title: e['title'],
          id: e['id'],
        ),
      ),
    );
    return list;
  }
}
