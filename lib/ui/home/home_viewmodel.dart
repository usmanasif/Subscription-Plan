import 'package:dio/dio.dart';
import 'package:flutter_stacked_starter/app/app.logger.dart';
import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/services/subscription_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');
  final _subscriptionService = locator<SubscriptionService>();
  final _navigationService = locator<NavigationService>();
  Subscriptions? _subscriptions;
  Subscriptions? get subscriptions => _subscriptions;

  Future<void> getSubscriptions({bool setViewToBusy = true}) async {
    try {
      _subscriptions =
          await runBusyFuture(_subscriptionService.getSubscriptions());
      notifyListeners();
    } on DioException catch (e) {
      log.e('DioException occurred: $e');
    } catch (e) {
      log.e('Generic exception: $e');
    }
  }

  Future<void> onRefresh() => getSubscriptions(setViewToBusy: false);

  void back() => _navigationService.back();
}
