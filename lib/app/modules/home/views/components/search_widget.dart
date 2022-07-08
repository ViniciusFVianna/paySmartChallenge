import 'package:challenge_movies/app/utilities/app_colors.dart';
import 'package:challenge_movies/app/utilities/app_txt_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class SearchWidget extends StatelessWidget {
 const SearchWidget({
    Key? key,
    required this.controller
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: 8 ,
            vertical: 4,
        ),
        decoration: BoxDecoration(
          color: AppColors.colorPrimary.withOpacity(0.99),
          borderRadius: BorderRadius.circular(8)
        ),
        child: TextField(
          controller: controller.searchController.value,
          cursorColor: AppColors.colorWhite,
          onSubmitted: (stg) => controller.fetchSearchMovies(stg),
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            focusColor: AppColors.colorWhite,
            prefixIcon: Icon(
              FeatherIcons.search,
              color: AppColors.colorWhite.withOpacity(0.5),
              size: 24,
            ),
            hintText: 'Search...',
            hintStyle: AppTextStyles.paragraph.copyWith(color: AppColors.colorWhite.withOpacity(0.5))
          ),
          style: AppTextStyles.paragraph.copyWith(
              color: AppColors.colorWhite.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
