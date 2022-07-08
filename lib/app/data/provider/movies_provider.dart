import 'package:challenge_movies/app/utilities/constants_strings.dart';
import 'package:get/get.dart';

class MoviesProvider extends GetConnect{
  Future<Response> getMovies() async {
    String url = ConstantsStrings.upcomingEndPoint.replaceAll(':api_key', ConstantsStrings.apiKey);
    final header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${ConstantsStrings.accessToken}'
    };

    print(url);

    return await get(url, headers: header);
  }

  Future<Response> getMovie(String movieId) async {
    String url = ConstantsStrings.movieEndPoint
        .replaceAll(':api_key', ConstantsStrings.apiKey)
        .replaceAll(':movie_id', movieId);
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ConstantsStrings.accessToken}'
    };

    print(url);

    return await get(url, headers: header);
  }

  Future<Response> getSearchMovies(String queryString) async {
    String url = ConstantsStrings.searchMovieEndPoint
        .replaceAll(':api_key', ConstantsStrings.apiKey)
        .replaceAll(':query_key', queryString.replaceAll(' ', "%20"));
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ConstantsStrings.accessToken}'
    };
    final query = {
      "query": queryString
    };

    print(url);

    return await get(url, headers: header, query: query);
  }
}