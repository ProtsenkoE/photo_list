part of 'get_photos_bloc.dart';

@immutable
abstract class GetPhotosEvent {
  const GetPhotosEvent();
}

class LoadPhotosEvent extends GetPhotosEvent {
  const LoadPhotosEvent();
}
