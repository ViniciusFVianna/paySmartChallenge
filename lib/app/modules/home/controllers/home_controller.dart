import 'package:challenge_movies/app/data/models/pagination_filter.dart';
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
  Rx<PaginationFilter> paginationFilter = PaginationFilter().obs;
  RxList<Movie> movies = <Movie>[].obs;
  Rx<String> queryString = "".obs;

  PaginationFilter? filter;

  Rx<bool> isLoading = false.obs;
  Rx<bool> replace = false.obs;

  @override
  void onInit() {
    super.onInit();
    queryPaginated.value.page = 1;
    // ever(queryPaginated, (_) => fetchMovies(onSuccess: () => isLoading.value = false));
    fetchMovies(onSuccess: () {
      isLoading.value = false;
      filter!.query = queryString.value;
      filter!.page = queryPaginated.value.page;
      filter!.totalPages = queryPaginated.value.totalPages;
    });
  }

  Future<void> fetchMovies({VoidCallback? onSuccess}) async {
    // isLoading.value = true;

    if (filter != null) {
      filter!.query = queryString.value;
      filter!.page = queryPaginated.value.page;
      filter!.totalPages = queryPaginated.value.totalPages;
    } else {
      filter = PaginationFilter(
          query: "",
          page: queryPaginated.value.page,
          totalPages: queryPaginated.value.totalPages
      );
    }

    final data = await repository.getMovies(filter);
    
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
      movies.addAll(queryPaginated.value.results!);

      filter!.query = queryString.value;
      filter!.page = queryPaginated.value.page;
      filter!.totalPages = queryPaginated.value.totalPages;

      if (onSuccess != null) onSuccess();
    });
  }

  Future<void> fetchSearchMovies(String query, {VoidCallback? onSuccess}) async {
    // isLoading.value = true;

    final data = query.isNotEmpty
    ? await repository.getSearchMovies(filter)
    : await repository.getMovies(filter);

    data.fold((l) {
      // isLoading.value = false;
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

      filter!.query = queryString.value;
      filter!.page = queryPaginated.value.page;
      filter!.totalPages = queryPaginated.value.totalPages;

      print(queryPaginated.value.totalPages);
      if(replace.value){
        movies.clear();
        movies.value = queryPaginated.value.results!;
      }else{
      movies.addAll(queryPaginated.value.results!);
      }

      if (onSuccess != null) onSuccess();
    });
  }

  void setFilterQuery(String query) {
    if (filter != null) {
      queryString.value = query;
      filter!.query = queryString.value;
      filter!.page = queryPaginated.value.page;
      filter!.totalPages = queryPaginated.value.totalPages;
      replace.value = true;
    } else {
      filter = PaginationFilter(
        query: "",
        page: queryPaginated.value.page,
        totalPages: queryPaginated.value.totalPages
      );
      replace.value = false;
    }
    fetchSearchMovies(filter!.query.toString(), onSuccess: () => isLoading.value = false);
  }

  void nextPage() async {
      filter!.page = (queryPaginated.value.page! + 1) > queryPaginated.value.totalPages!
          ? queryPaginated.value.totalPages!
          : queryPaginated.value.page! + 1;
      replace.value = false;
      if((queryPaginated.value.page! + 1) <= queryPaginated.value.totalPages!) {
        fetchSearchMovies(filter!.query.toString(), onSuccess: () => isLoading.value = false);
      }
  }

}