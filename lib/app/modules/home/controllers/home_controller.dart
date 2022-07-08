import 'package:challenge_movies/app/data/repository/i_movies_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import '../../../data/models/movie.dart';
import '../../../data/models/query_paginated.dart';
import '../../../utilities/app_colors.dart';

class HomeController extends GetxController {
  final IMoviesRepository repository;
  HomeController(this.repository);

  Rx<TextEditingController> searchController = TextEditingController().obs;

  Rx<QueryPaginated<Movie>> queryPaginated = QueryPaginated<Movie>().obs;

  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies(onSuccess: () => isLoading.value = false);
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> fetchMovies({VoidCallback? onSuccess}) async {
    isLoading.value = true;

    final data = await repository.getMovies();
    
    data.fold((l) {
      isLoading.value = false;
      return Get.showSnackbar(GetSnackBar(
      icon: Icon(
        FeatherIcons.info,
        color: AppColors.colorWhite,
      ),
      message: l.error.toString(),
      backgroundColor: AppColors.colorWarning,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
    ));
    }, (r){
      queryPaginated.value = r;
      if (onSuccess != null) onSuccess();
    });
  }

  Future<void> fetchSearchMovies(String query, {VoidCallback? onSuccess}) async {
    isLoading.value = true;

    final data = await repository.getSearchMovies(query);

    data.fold((l) {
      isLoading.value = false;
      return Get.showSnackbar(GetSnackBar(
        icon: Icon(
          FeatherIcons.info,
          color: AppColors.colorWhite,
        ),
        message: l.error.toString(),
        backgroundColor: AppColors.colorWarning,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      ));
    }, (r){
      queryPaginated.value = r;
      if (onSuccess != null) onSuccess();
    });
  }

}
