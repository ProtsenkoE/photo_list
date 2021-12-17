part of 'get_photos_bloc.dart';

enum PhotoStatus { loading, success, noData, failure }

class GetPhotosInitial extends Equatable {
  const GetPhotosInitial._({
    this.status = PhotoStatus.loading,
    this.photo = const Photo(),
  });

  const GetPhotosInitial.loading() : this._(status: PhotoStatus.loading);

  const GetPhotosInitial.failure() : this._(status: PhotoStatus.failure);

  const GetPhotosInitial.noData() : this._(status: PhotoStatus.noData);

  const GetPhotosInitial.success(
    List<Photo> photo,
  ) : this._(
          status: PhotoStatus.success,
          photo: photo,
        );

  final PhotoStatus status;
  final photo;

  @override
  List<Object?> get props => [status, photo];
}
