import 'package:challenge_movies/app/data/provider/movies_provider.dart';
import 'package:challenge_movies/app/data/repository/movies_repository.dart';
import 'package:get/get.dart';

import '../../../data/repository/i_movies_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MoviesProvider());
    Get.put<IMoviesRepository>(MoviesRepository(Get.find()));
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
    );
  }
}
