import 'package:dio/dio.dart';
import 'package:flutter_stacked_starter/app/app.logger.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  Future<void> getPosts({bool setViewToBusy = true}) async {
    try {} on DioException catch (e) {
      log.e('DioException occurred: $e');
    } catch (e) {
      log.e('Generic exception: $e');
    }
  }

  Future<void> onRefresh() => getPosts(setViewToBusy: false);
}
