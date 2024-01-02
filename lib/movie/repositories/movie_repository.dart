import 'package:animon/movie/models/movie_detail_detail.dart';
import 'package:animon/movie/models/movie_model.dart';
import 'package:animon/movie/models/movie_video_model.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository{
  Future <Either <String, MovieResponseModel>> getDiscover({int page = 1});
  Future <Either <String, MovieResponseModel>> getPopular({int page = 1});
  Future <Either <String, MovieResponseModel>> search({required String query});
  Future <Either <String, MovieDetailModel>> getDetail({required int id});
  Future<Either<String, MovieVideosModel>> getVideos({required int id});
}
