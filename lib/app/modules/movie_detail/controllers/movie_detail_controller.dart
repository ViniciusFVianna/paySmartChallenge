import 'package:challenge_movies/app/data/models/MovieDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import '../../../data/repository/i_movies_repository.dart';
import '../../../utilities/app_colors.dart';

class MovieDetailController extends GetxController {
  final IMoviesRepository repository;
  MovieDetailController(this.repository);

  Rx<MovieDetail> movieDetail = MovieDetail().obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fromMovieId();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fromMovieId() {
    final paramId = Get.parameters['movie_id'];

    if(paramId != null){
      getMovie(paramId);
    }else{
      Get.back();
    }

  }

  void getMovie(String movieId, {VoidCallback? onSuccess}) async {
    isLoading.value = true;
    final result = await repository.getMovie(movieId);

    result.fold((l) {
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
    }, (r) {
      movieDetail.value = r;
      if (onSuccess != null) onSuccess();
      isLoading.value = false;
    });
  }

  }
