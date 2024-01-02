import 'package:animon/movie/providers/movie_get_detail_provider.dart';
import 'package:animon/movie/providers/movie_get_discover_provider.dart';
import 'package:animon/movie/providers/movie_get_popular_provides.dart';
import 'package:animon/movie/providers/movie_get_videos_provider.dart';
import 'package:animon/movie/providers/movie_search_povider.dart';
import 'package:animon/movie/repositories/movie_repository.dart';
import 'package:animon/movie/repositories/movie_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app_constants.dart';

final sl = GetIt.instance;

void setup() {
  // Register Provider
  sl.registerFactory<MovieGetDiscoverProvider>(
    () => MovieGetDiscoverProvider(sl()),
  );
  sl.registerFactory<MovieGetPopularProvider>(
    () => MovieGetPopularProvider(sl()),
  );
  sl.registerFactory<MovieGetDetailProvider>(
    () => MovieGetDetailProvider(sl()),
  );
  sl.registerFactory<MovieGetVideosProvider>(
    () => MovieGetVideosProvider(sl()),
  );
  sl.registerFactory<MovieSearchProvider>(
    () => MovieSearchProvider(sl()),
  );

  // Register Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  // Register Http Client (DIO)
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        queryParameters: {
          'with_genres' : AppConstants.animeGenre,
          'sort_by' : AppConstants.sortAnime,
          'with_keywords' : AppConstants.keyWord,
          'with_original_language' : AppConstants.language,
          'api_key' : AppConstants.apiKey,
          'include_adult' : AppConstants.adult
          },
        ),
    ),
  );
}

