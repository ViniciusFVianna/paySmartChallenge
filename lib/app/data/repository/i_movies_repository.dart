import 'package:dartz/dartz.dart';

import '../../utilities/error_response.dart';
import '../models/MovieDetail.dart';
import '../models/movie.dart';
import '../models/pagination_filter.dart';
import '../models/query_paginated.dart';

abstract class IMoviesRepository {

  Future<Either<ErrorResponse, QueryPaginated<Movie>>> getMovies(PaginationFilter? filter);
  Future<Either<ErrorResponse, QueryPaginated<Movie>>> getSearchMovies(PaginationFilter? filter);
  Future<Either<ErrorResponse, MovieDetail>> getMovie(String movieId);
}