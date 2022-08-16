import 'package:dio/dio.dart';
import 'package:movie_trial/mixins/constant/constant.dart';
import 'package:movie_trial/mixins/network/error_handling.dart';
import 'package:movie_trial/mixins/network/interceptor.dart';
import 'package:movie_trial/model/detail_movie.dart';
import 'package:movie_trial/model/res/movie_res.dart';
import '../mixins/logging/logger.dart';

class MovieProvider{
  late Dio _dio;

  MovieProvider(){
    BaseOptions options  =
    BaseOptions(
        baseUrl: kUrlAPI,
        receiveTimeout: 15000,
        connectTimeout: kConnectionTimeout
    );
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }


  Future<DetailMovie> geDetailMovie(String id) async {
    try {
        final response = await _dio.get(
          '/movie/$id',
          queryParameters: {
            'api_key':kApiKey
          },
        );
      return DetailMovie.fromJson(response.data);
    } catch (e, s) {
      logger.e('getDetailMovie', e, s);
      return Future.error(ErrorHandling(e));
    }
  }

  Future<MovieRes> getTopRatedMovie(int page) async {
    try {
        final response = await _dio.get(
        '/movie/top_rated',
        queryParameters: {
          'page':'$page',
          'api_key':kApiKey
        },
      );
      return MovieRes.fromJson(response.data);
    } catch (e, s) {
      logger.e('getMoviePopular', e, s);
      return Future.error(ErrorHandling(e));
    }
  }
}