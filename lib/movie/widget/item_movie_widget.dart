import 'package:animon/movie/models/movie_detail_detail.dart';
import 'package:animon/movie/models/movie_model.dart';
import 'package:animon/movie/widget/image_widget.dart';
import 'package:flutter/material.dart';

class ItemMovieWidget extends Container {
  final MovieModel? movie;
  final MovieDetailModel? movieDetail;
  final double widthBackdrop;
  final double heightBackdrop;
  final double widthPoster;
  final double heightPoster;
  final double radius;
  final void Function()? onTap;

  ItemMovieWidget({
    this.movie,
    this.movieDetail,
    required this.heightPoster,
    required this.heightBackdrop,
    required this.widthBackdrop,
    required this.widthPoster,
    this.radius = 12,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Stack(
        children: [
          ImageNetworkWidget(
            imageSrc:
                '${movieDetail != null ? movieDetail!.backdropPath : movie!.backdropPath}',
            height: heightBackdrop,
            width: widthBackdrop,
            radius: 12,
          ),
          Container(
            height: heightBackdrop,
            width: widthBackdrop,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  // borderRadius: BorderRadius.circular(12),
                  child: ImageNetworkWidget(
                    imageSrc:
                        '${movieDetail != null ? movieDetail!.posterPath : movie!.backdropPath}',
                    height: heightPoster,
                    width: widthPoster,
                    radius: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movieDetail != null ? movieDetail!.title : movie!.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      '${movieDetail != null ? movieDetail!.voteAverage : movie!.voteAverage} (${movieDetail != null ? movieDetail!.voteCount : movie!.voteCount})',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
