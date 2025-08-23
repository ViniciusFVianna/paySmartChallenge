class ConstantsStrings {
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/original/';
  static const String v3 = '3';
  static const String apiKey = 'API_KEY';
  static const String accessToken = 'ACCESS_TOKEN';


  static const String movieEndPoint = '$baseUrl/$v3/movie/:movie_id?:api_key&language=pt-BR';
  static const String upcomingEndPoint = '$baseUrl/$v3/movie/upcoming?:api_key&language=pt-BR';
  static const String searchMovieEndPoint = '$baseUrl/$v3/search/movie?:api_key&language=pt-BR';

  static const String authPrefs = 'auth-prefs';
  static const String authUserPrefs = 'auth-user-prefs';
  static const String sellerIdPrefs = 'seller-id-prefs';
  static const String userCep = 'user-ceps';

}