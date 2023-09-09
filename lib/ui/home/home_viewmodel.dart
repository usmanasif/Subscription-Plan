import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_stacked_starter/app/app.logger.dart';
import 'package:flutter_stacked_starter/services/posts_service.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';
import '../../constants/app_keys.dart';
import '../../models/application_models.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  final _postsService = locator<PostsService>();

  List<Post> _posts = [];
  List<Post> get posts => UnmodifiableListView(_posts);

  bool get hasPosts => _posts.isNotEmpty;

  Future<void> getPosts({bool setViewToBusy = true}) async {
    try {
      _posts = await runBusyFuture(
        _postsService.getAllPosts(),
        throwException: true,
        busyObject: setViewToBusy ? AppKeys.homeViewBusy : null,
      );
    } on DioException catch (e) {
      log.e('DioException occurred: $e');
    } catch (e) {
      log.e('Generic exception: $e');
    }
  }

  Future<void> onRefresh() => getPosts(setViewToBusy: false);
}
