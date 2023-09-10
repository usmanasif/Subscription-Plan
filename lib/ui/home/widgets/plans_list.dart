import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/ui/home/home_viewmodel.dart';
import 'package:flutter_stacked_starter/ui/home/widgets/subcription_tile.dart';
import 'package:stacked/stacked.dart';

class PlansList extends ViewModelWidget<HomeViewModel> {
  const PlansList({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: viewModel.subscriptions?.subscriptions.length,
      itemBuilder: (context, index) => SubScriptionTile(
        icon: viewModel.getIcon(index),
        currency: viewModel.subscriptions?.subscriptions[index].currency ?? '',
        duration: viewModel.subscriptions?.subscriptions[index].duration ?? 0,
        features: viewModel.subscriptions?.subscriptions[index].features ?? [],
        name: viewModel.subscriptions?.subscriptions[index].name ?? '',
        price: viewModel.subscriptions?.subscriptions[index].price ?? 0,
      ),
    );
  }
}
