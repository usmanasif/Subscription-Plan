import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/constants/app_keys.dart';
import 'package:flutter_stacked_starter/ui/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Body extends ViewModelWidget<HomeViewModel> {
  const Body({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    Column buildNoDataWidget() {
      return Column(
        children: [
          const Center(
            child: Text('No posts to show'),
          ),
          TextButton(
            onPressed: viewModel.onRefresh,
            child: const Text('Refresh'),
          )
        ],
      );
    }

    Center buildLoadingWidget() {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (viewModel.busy(AppKeys.homeViewBusy)) ...[
          buildLoadingWidget()
        ] else if (viewModel.hasPosts) ...[
          Expanded(
            child: RefreshIndicator(
              onRefresh: viewModel.onRefresh,
              child: ListView.separated(
                itemCount: viewModel.posts.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  final post = viewModel.posts[index];

                  return ListTile(
                    title: Text(post.title),
                  );
                },
              ),
            ),
          )
        ] else ...[
          buildNoDataWidget()
        ]
      ],
    );
  }
}
