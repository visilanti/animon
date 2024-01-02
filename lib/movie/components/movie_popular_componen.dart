import 'package:animon/movie/pages/movie_detail_page.dart';
import 'package:animon/movie/providers/movie_get_popular_provides.dart';
import 'package:animon/movie/widget/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviePopularComponent extends StatefulWidget {
  const MoviePopularComponent({super.key});

  @override
  State<MoviePopularComponent> createState() => _MoviePopularComponentState();
}

class _MoviePopularComponentState extends State<MoviePopularComponent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieGetPopularProvider>().getPopular(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Consumer<MovieGetPopularProvider>(
                builder: (_, provider, __){
                  if (provider.isLoading) {
                    return Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                    );
                  }

                  if (provider.movies.isNotEmpty) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index){
                        final movie = provider.movies[index];

                        return Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 200,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black12,
                                ]),
                                borderRadius: BorderRadius.circular(12.0)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImageNetworkWidget(
                                    imageSrc: movie.posterPath, 
                                    height: 200, 
                                    width: 120,
                                    radius: 12.0,
                                  ),
                                  const SizedBox(width: 8.0,),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          movie.title, 
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                        ),),
                                        Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '${movie.voteAverage} (${movie.voteCount})',
                                            style: const TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                          movie.overview, 
                                          maxLines: 3,
                                          style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w400,
                                        ),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (_) {
                                        return MovieDetailPage(id: movie.id);
                                      },
                                    ));
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }, 
                      separatorBuilder: (_, __) => const SizedBox(
                        width: 8.8,
                    ), itemCount: provider.movies.length);
                  }

                  return Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: Text('Not fond populer anime'),
                        ),
                    );
                },
              ),
            ),
      );
  }
}