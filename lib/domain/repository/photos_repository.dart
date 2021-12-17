import 'package:photo_list/data/store/photos_store.dart';
import 'package:photo_list/domain/model/models.dart';

abstract class PhotosRepository {
  Future<List<Photo>> getPhotos();
}

class PhotosRepositoryIml implements PhotosRepository {
  final PhotosStore photosStore;

  PhotosRepositoryIml(this.photosStore);

  @override
  Future<List<Photo>> getPhotos() async {
    return await photosStore.getPhotos();
  }
}
