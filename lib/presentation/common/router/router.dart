import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_list/domain/model/photo.dart';
import 'package:photo_list/presentation/details/photo_details_screen.dart';
import 'package:photo_list/presentation/main_screen.dart';

class RouterFluro {
  static final FluroRouter router = FluroRouter();

  static final Handler _mainHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const MainScreen());

  static final Handler _detailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          PhotoDetails(details: context?.settings?.arguments as Photo));

  static void setupRouter() {
    router.define(
      '/',
      handler: _mainHandler,
    );
    router.define(
      '/details/:id',
      handler: _detailHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
