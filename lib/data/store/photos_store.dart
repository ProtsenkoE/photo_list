import 'package:photo_list/data/network_service.dart';
import 'package:photo_list/domain/model/photo.dart';

class PhotosStore {
  final NetworkService networkService;

  PhotosStore(this.networkService);

  Future<List<Photo>> getPhotos() async {
    return await networkService.getPhotos();
  }
}
