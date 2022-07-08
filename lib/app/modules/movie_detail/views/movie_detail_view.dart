import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_movies/app/utilities/app_colors.dart';
import 'package:challenge_movies/app/utilities/app_txt_style.dart';
import 'package:challenge_movies/app/utilities/constants_strings.dart';
import 'package:challenge_movies/app/widgets/list_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.colorPrimary,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40
      ),
      child: const ListLoader(),
    )
        : Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.colorPrimary,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,
                      child: CachedNetworkImage(
                        imageUrl : '${ConstantsStrings.baseImageUrl}${controller.movieDetail.value.posterPath}',
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: AppColors.colorPrimary,
                            highlightColor: AppColors.colorSecondary,
                            child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 2,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  color: AppColors.colorPrimary,
                                ))),
                        errorWidget: (context, url, error) => Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/img_not_found.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),

                       SizedBox(height: MediaQuery.of(context).size.height / 2.2,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          controller.movieDetail.value.title.toString(),
                          style: AppTextStyles.textHeading6Bold.copyWith(
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _ratingCard(),
                            const SizedBox(width: 18,),
                            _durationCard(),
                            const SizedBox(width: 18,),
                            _pgCard(),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Generos',
                          style: AppTextStyles.smallBold.copyWith(
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                          controller.movieDetail.value.genres!.length,
                            (index) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              margin: const EdgeInsets.only(right: 8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.colorTertiary),
                              ),
                              child: Text(
                                controller.movieDetail.value.genres![index].name.toString(),
                                style: AppTextStyles.paragraph.copyWith(
                                  color: AppColors.colorWhite,
                                ),
                              ),
                            ),),
                        ),
                      ),

                      const SizedBox(height: 16,),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: Row(
                         children: [
                           Text(
                             'Data de Lançamento:',
                             style: AppTextStyles.smallBold.copyWith(
                               color: AppColors.colorWhite,
                             ),
                           ),

                           const SizedBox(width: 2,),

                           Text(
                             DateFormat('dd/MM/yyyy').format(DateTime.parse(controller.movieDetail.value.releaseDate.toString())),
                             style: AppTextStyles.paragraph.copyWith(
                               color: AppColors.colorWhite,
                             ),
                           ),
                         ],
                       ),
                     ),
                      const SizedBox(height: 16,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Sinopse',
                          style: AppTextStyles.smallBold.copyWith(
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          controller.movieDetail.value.overview.toString(),
                          style: AppTextStyles.paragraph.copyWith(
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ),


                      const SizedBox(height: 16,),
                    ],),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  _ratingCard() => Container(
    height: 58,
    width: 98,
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 8,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.colorTertiary, width: 0.5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBarIndicator(
          rating: (controller.movieDetail.value.voteAverage)! / 3,
          itemBuilder: (context, index) => Icon(Icons.star, color: AppColors.colorWarning,),
          itemCount: 5,
          itemSize: 16,
          unratedColor:  const Color(0xff33f9b300),
          direction: Axis.horizontal,
        ),
        const SizedBox(height: 5,),
        Text(
          '${controller.movieDetail.value.voteAverage}/10',
          style: AppTextStyles.paragraphBold.copyWith(
            color: AppColors.colorWhite,
          ),
        )
      ],
    ),
  );

  _durationCard() => Container(
    height: 58,
    width: 98,
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 8,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.colorTertiary, width: 0.5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Duração',
          style: AppTextStyles.small.copyWith(
            color: AppColors.colorWhite.withOpacity(0.6),
          ),
        ),
        Text(
          '${controller.movieDetail.value.runtime} min',
          style: AppTextStyles.paragraphBold.copyWith(
            color: AppColors.colorWhite,
          ),
        ),
      ],
    ),
  );

  _pgCard() => Container(
    height: 58,
    width: 98,
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 8,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.colorTertiary, width: 0.5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Língua',
          style: AppTextStyles.small.copyWith(
            color: AppColors.colorWhite.withOpacity(0.6),
          ),
        ),
        Text(
          controller.movieDetail.value.originalLanguage.toString().toUpperCase(),
          style: AppTextStyles.paragraphBold.copyWith(
            color: AppColors.colorWhite,
          ),
        ),
      ],
    ),
  );

}
