import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/services/api_service.dart';

import '../app/app.locator.dart';

class SubscriptionService {
  final _apiService = locator<ApiService>();
  Future<Subscriptions> getSubscriptions() async {
    ApiResponse apiResponse = await _apiService.get(
        url: 'https://mocki.io/v1/3a48fd1d-d832-486d-a5dc-9c4e38fbea0f');
    return Subscriptions.fromJson(apiResponse.data);
  }
}
