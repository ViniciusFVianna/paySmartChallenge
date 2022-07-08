import 'dart:convert';

import 'package:challenge_movies/app/data/models/query_paginated.dart';
import 'package:challenge_movies/app/data/provider/movies_provider.dart';
import 'package:challenge_movies/app/utilities/error_response.dart';
import 'package:dartz/dartz.dart';

import '../models/MovieDetail.dart';
import '../models/movie.dart';
import '../provider/movies_provider.dart';
import 'i_movies_repository.dart';

class MoviesRepository implements IMoviesRepository {
  final MoviesProvider provider;
  MoviesRepository(this.provider);

  @override
  Future<Either<ErrorResponse, QueryPaginated<Movie>>> getMovies() async {
    try{
      final resp = await provider.getMovies();
      Map<String, dynamic> data = resp.body;

      if (data['success'] != false) {
        return right(
          QueryPaginated<Movie>.fromJson(data)
            ..results = (data['results'] as List)
                .map(
                  (e) => Movie.fromJson(e),
            )
                .toList(),
        );
      } else {
        print('ERROR ELSE ${resp.status.code}');
        return left(
          ErrorResponse(
            error: data['status_message'],
            statusCode: resp.statusCode,
          ),
        );
      }

    }catch(e){
      print('CATCH $e');
      return left(ErrorResponse(error: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, MovieDetail>> getMovie(String movieId) async {
    try{
      final resp = await provider.getMovie(movieId);
      Map<String, dynamic> data = resp.body;

      if (data['success'] != false) {
        return right(
          MovieDetail.fromJson(data),
        );
      } else {
        print('ERROR ELSE ${resp.status.code}');
        return left(
          ErrorResponse(
            error: data['status_message'],
            statusCode: resp.statusCode,
          ),
        );
      }

    }catch(e){
      print('CATCH $e');
      return left(ErrorResponse(error: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, QueryPaginated<Movie>>> getSearchMovies(String query) async {
    try{
      final resp = await provider.getSearchMovies(query);
      Map<String, dynamic> data = resp.body;

      if (data['success'] != false) {
        return right(
          QueryPaginated<Movie>.fromJson(data)
            ..results = (data['results'] as List)
                .map(
                  (e) => Movie.fromJson(e),
            )
                .toList(),
        );
      } else {
        print('ERROR ELSE ${resp.status.code}');
        return left(
          ErrorResponse(
            error: data['status_message'],
            statusCode: resp.statusCode,
          ),
        );
      }

    }catch(e){
      print('CATCH $e');
      return left(ErrorResponse(error: e.toString()));
    }
  }
}