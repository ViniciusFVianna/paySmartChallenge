import 'package:challenge_movies/app/modules/home/views/components/search_widget.dart';
import 'package:challenge_movies/app/utilities/app_colors.dart';
import 'package:challenge_movies/app/widgets/list_loader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../controllers/home_controller.dart';
import 'components/movie_list_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          color: AppColors.colorPrimary.withOpacity(0.9),
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(
                      controller: controller,
                    onSubmitted: (stg) => controller.setFilterQuery(stg),
                  ),
               Expanded(
                    child: controller.isLoading.isFalse
                 ? LazyLoadScrollView(
                   onEndOfPage: () => controller.nextPage(),
                   isLoading: controller.isLoading.value,
                   child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.movies.length,
                                itemBuilder: (context, index) => MovieListItem(
                                    movie: controller.movies[index]),
                        ),
                 )
                       : SingleChildScrollView(child: Column(children: List.generate(5, (index) => const ListLoader()),)),
               ),
                ]),
          ),
        ),
      ),
    );
  }
}
