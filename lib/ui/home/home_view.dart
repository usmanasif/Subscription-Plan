import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stacked_starter/constants/constants.dart';
import 'package:flutter_stacked_starter/ui/home/home_viewmodel.dart';
import 'package:flutter_stacked_starter/utils/app_text.dart';
import 'package:flutter_stacked_starter/utils/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getSubscriptions();
  }

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcPrimaryColor,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        leading: InkWell(
            onTap: () => viewModel.back,
            child: Icon(
              Icons.arrow_back_ios,
              size: 22.sp,
              color: Colors.white,
            )),
        title: Text(
          'Subscription Plan',
          style: kRubikText.copyWith(
            fontSize: 17.sp,
          ),
        ),
      ),
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(color: Colors.white),
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: viewModel.subscriptions?.subscriptions.length,
              itemBuilder: (context, index) => SubScriptionTile(
                currency:
                    viewModel.subscriptions?.subscriptions[index].currency ??
                        '',
                duration:
                    viewModel.subscriptions?.subscriptions[index].duration ?? 0,
                features:
                    viewModel.subscriptions?.subscriptions[index].features ??
                        [],
                name: viewModel.subscriptions?.subscriptions[index].name ?? '',
                price: viewModel.subscriptions?.subscriptions[index].price ?? 0,
              ),
            ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

class SubScriptionTile extends ViewModelWidget<HomeViewModel> {
  final String name;
  final int price;
  final String currency;
  final List<String> features;
  final int duration;
  const SubScriptionTile({
    super.key,
    required this.name,
    required this.price,
    required this.currency,
    required this.features,
    required this.duration,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
          margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: const Color(0xFFEBEBF0), width: 2.0),
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      name,
                      style: kRubikText.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFEBEBF0)),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "$currency$price",
                          style: kRubikText.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFEBEBF0)),
                        ),
                        Text(
                          "/$duration months",
                          style: kRubikText.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFFEBEBF0)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return verticalSpaceSmall;
                  },
                  itemCount: features.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10.sp,
                      ),
                    ),
                    horizontalSpaceSmall,
                    Text(
                      features[index],
                      style: kRubikText.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFEBEBF0)),
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: kcSecondaryColor),
              child: const Icon(
                Icons.message,
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
