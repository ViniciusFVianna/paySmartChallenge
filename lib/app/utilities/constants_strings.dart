class ConstantsStrings {
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/original/';
  static const String v3 = '3';
  static const String apiKey = '2259be502e6fdf62c184d9ad58df647ec';
  static const String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMjU5YmU1MDJlNmZkZjYyYzE4NGQ5YWQ1OGRmNjQ3ZSIsInN1YiI6IjYyYzRhM2NkOTY3MmVkMjNjZWZmZWNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Kfhsb5MP_Pg8jybPmdNb6yDhfOfZ9EWIPbBMLrbUc3U';

  // static const String moviesEndPoint = 'movie/550?$apiKey';
  static const String moviesEndPoint = '$baseUrl/$v3/movie/550';
  static const String movieEndPoint = '$baseUrl/$v3/movie/:movie_id?:api_key&language=pt-BR';
  static const String upcomingEndPoint = '$baseUrl/$v3/movie/upcoming?:api_key&language=pt-BR';
  static const String searchMovieEndPoint = '$baseUrl/$v3/search/movie?:api_key&language=pt-BR&query=:query_key';
  static const String discoverMoviesEndPoint = '$baseUrl/$v3/discover/movie?:api_key';
  static const String genersEndPoint = '$baseUrl/$v3/genre/movie/list?:api_key';

  static const String authPrefs = 'auth-prefs';
  static const String authUserPrefs = 'auth-user-prefs';
  static const String sellerIdPrefs = 'seller-id-prefs';
  static const String userCep = 'user-ceps';

}