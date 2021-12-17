import 'package:photo_list/data/network_service.dart';
import 'package:photo_list/data/store/photos_store.dart';
import 'package:photo_list/domain/repository/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_list/presentation/home/bloc/get_photos/get_photos_bloc.dart';

Future<void> initDi() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton(
      () => NetworkService('608bd4239f42b20017c3cee6.mockapi.io'));
  getIt.registerLazySingleton(() => PhotosStore(getIt.get()));
  getIt.registerLazySingleton(() => PhotosRepositoryIml(getIt.get()));
  getIt.registerLazySingleton(() => GetPhotosBloc(getIt.get()));
}
