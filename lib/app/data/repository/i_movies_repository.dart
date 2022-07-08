import 'package:dartz/dartz.dart';

import '../../utilities/error_response.dart';
import '../models/MovieDetail.dart';
import '../models/movie.dart';
import '../models/query_paginated.dart';

abstract class IMoviesRepository {

  Future<Either<ErrorResponse, QueryPaginated<Movie>>> getMovies();
  Future<Either<ErrorResponse, QueryPaginated<Movie>>> getSearchMovies(String query);
  Future<Either<ErrorResponse, MovieDetail>> getMovie(String movieId);
}