import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_list/domain/model/models.dart';
import 'package:photo_list/domain/repository/repository.dart';
import 'package:meta/meta.dart';

part 'get_photos_event.dart';
part 'get_photos_state.dart';

class GetPhotosBloc extends Bloc<GetPhotosEvent, GetPhotosInitial> {
  final PhotosRepositoryIml repository;

  GetPhotosBloc(this.repository) : super(const GetPhotosInitial.loading()) {
    on<LoadPhotosEvent>((event, emit) async {
      try {
        final photos = await repository.getPhotos();
        if (photos.isEmpty) {
          emit(const GetPhotosInitial.noData());
        } else {
          emit(GetPhotosInitial.success(photos));
        }
      } on Exception {
        emit(const GetPhotosInitial.failure());
        rethrow;
      }
    });

    add(const LoadPhotosEvent());
  }
}
