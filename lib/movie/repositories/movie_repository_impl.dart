import 'package:animon/movie/models/movie_detail_detail.dart';
import 'package:animon/movie/models/movie_model.dart';
import 'package:animon/movie/models/movie_video_model.dart';
import 'package:animon/movie/repositories/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio _dio;

  MovieRepositoryImpl(this._dio);

  @override
  Future<Either <String, MovieResponseModel>> getDiscover({int page = 1}) async {
    try {
      final result = await _dio.get(
        '/discover/movie', 
        queryParameters:{'page': page},
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = MovieResponseModel.fromMap(result.data);
        return Right(model);
      }

      return const Left('Error get discover movie');
      
    } on DioException catch (e) {
      if(e.response != null){
        return Left(e.response.toString());
      }

      return const Left('Another error on get discover movies');
    }
  }
  
  @override
  Future<Either<String, MovieResponseModel>> getPopular({int page = 1}) async {
  try {
      final result = await _dio.get(
        '/movie/popular', 
        queryParameters:{'page': page},
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = MovieResponseModel.fromMap(result.data);
        return Right(model);
      }

      return const Left('Error get popular movie');
      
    } on DioException catch (e) {
      if(e.response != null){
        return Left(e.response.toString());
      }

      return const Left('Another error on get popular movies');
    }
  }

  @override
  Future<Either<String, MovieDetailModel>> getDetail({required int id}) async {
    try {
      final result = await _dio.get(
        '/movie/$id'
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = MovieDetailModel.fromMap(result.data);
        return Right(model);
      }

      return const Left('Error get anime detail ');
      
    } on DioException catch (e) {
      if(e.response != null){
        return Left(e.response.toString());
      }

      return const Left('Another error on get anime detail');
    }
  }

@override
  Future<Either<String, MovieVideosModel>> getVideos({required int id}) async {
    try {
      final result = await _dio.get(
        '/movie/$id/videos',
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = MovieVideosModel.fromMap(result.data);
        return Right(model);
      }

      return const Left('Error get movie videos');
    // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }

      return const Left('Another error on get movie videos');
    }
  }
  
@override
  Future<Either<String, MovieResponseModel>> search({
    required String query,
  }) async {
    try {
      final result = await _dio.get(
        '/search/movie',
        queryParameters: {"query": query},
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = MovieResponseModel.fromMap(result.data);
        return Right(model);
      }

      return const Left('We Can not find what you want');
    // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }

      return const Left('Another error on search movie');
    }
  }
}