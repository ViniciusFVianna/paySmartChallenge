import 'package:get/get.dart';

import '../../../data/provider/movies_provider.dart';
import '../../../data/repository/i_movies_repository.dart';
import '../../../data/repository/movies_repository.dart';
import '../controllers/movie_detail_controller.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MoviesProvider());
    Get.put<IMoviesRepository>(MoviesRepository(Get.find()));
    Get.lazyPut<MovieDetailController>(
      () => MovieDetailController(Get.find()),
    );
  }
}
