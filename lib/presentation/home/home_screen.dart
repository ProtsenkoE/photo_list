import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_list/presentation/common/constants/constants.dart';
import 'package:photo_list/presentation/error/error_screen.dart';
import 'package:photo_list/presentation/home/bloc/get_photos/get_photos_bloc.dart';
import 'package:photo_list/presentation/no_data/no_data.dart';
import 'package:photo_list/presentation/progress/progress_screen.dart';
import 'package:get_it/get_it.dart';

import 'photo_wrapper_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var getPhotoBloc = GetIt.instance.get<GetPhotosBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BlocBuilder<GetPhotosBloc, GetPhotosInitial>(
                bloc: getPhotoBloc,
                builder: (_, state) {
                  switch (state.status) {
                    case PhotoStatus.loading:
                      return const ProgressScreen();
                    case PhotoStatus.success:
                      return Flexible(
                        child: PhotoWrapperScreen(
                          listPhotos: state.photo,
                        ),
                      );
                    case PhotoStatus.noData:
                      return const NoDataScreen();
                    case PhotoStatus.failure:
                      return const ErrorScreen();
                    default:
                      return const NoDataScreen();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
