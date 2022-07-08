import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_movies/app/utilities/app_colors.dart';
import 'package:challenge_movies/app/utilities/app_txt_style.dart';
import 'package:challenge_movies/app/utilities/constants_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../data/models/movie.dart';
import '../../../../routes/app_pages.dart';

class MovieListItem extends StatelessWidget {
 const MovieListItem({
    Key? key,
    required this.movie,
  }) : super(key: key);
 final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.movieDetail, parameters: { "movie_id": movie!.id.toString()}),
      child: Container(
        height: 150,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 8),
        child: movie != null
        ? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl : '${ConstantsStrings.baseImageUrl}${movie!.posterPath}',
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

            const SizedBox(width: 8,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                   width: 250,
                   child: Text(movie!.title.toString(),
                      maxLines: 2,
                      style: AppTextStyles.paragraphBold.copyWith(
                        color: AppColors.colorWhite,
                      ),
                ),
                 ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie!.originalLanguage.toString(),
                      style: AppTextStyles.paragraph.copyWith(
                        color: AppColors.colorWhite,
                        fontSize: 16
                      ),
                    ),

                    Text(' | ',
                      style: AppTextStyles.paragraph.copyWith(
                        color: AppColors.colorWhite,
                      ),
                    ),

                    Text(movie!.releaseDate != null
                      ? DateFormat('dd/MM/yyyy').format(DateTime.parse(movie!.releaseDate.toString()))
                      : '00/00/0000',
                      style: AppTextStyles.paragraph.copyWith(
                        color: AppColors.colorWhite,
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 8,),

                SizedBox(
                  width: 250,
                  child: Text(movie!.overview.toString(),
                  softWrap: true,
                  maxLines: 5,
                    style: AppTextStyles.small.copyWith(
                      color: AppColors.colorWhite,
                      overflow: TextOverflow.ellipsis
                    ),
                  ),
                ),
              ],
            )
          ],
        )
        : Container(),
      ),
    );
  }
}
