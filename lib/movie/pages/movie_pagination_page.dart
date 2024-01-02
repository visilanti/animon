import 'package:animon/movie/models/movie_model.dart';
import 'package:animon/movie/pages/movie_detail_page.dart';
import 'package:animon/movie/providers/movie_get_discover_provider.dart';
import 'package:animon/movie/providers/movie_get_popular_provides.dart';
import 'package:animon/movie/widget/item_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

enum TypeMovie { discover, popular}

class MoviePaginationPage extends StatefulWidget {
  const MoviePaginationPage({super.key, required this.type});

  final TypeMovie type;

  @override
  State<MoviePaginationPage> createState() => _MoviePaginationPageState();
}

class _MoviePaginationPageState extends State<MoviePaginationPage> {
  
  final PagingController<int, MovieModel> _pagingController = PagingController(
    firstPageKey: 1
  );

  @override
  void initState(){
    _pagingController.addPageRequestListener((pageKey) {

      switch(widget.type){
        case TypeMovie.discover:
          context.read<MovieGetDiscoverProvider>().getDiscoverWithPaging(
            context, 
            pagingController: _pagingController, 
            page: pageKey,
          );
        break;
        case TypeMovie.popular:
          context.read<MovieGetPopularProvider>().getPopularWithPagination(
            context, 
            pagingController: _pagingController, 
            page: pageKey,
          );
        break;
      }
    });
    super.initState();
  }
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (_) {
            switch (widget.type) {
              case TypeMovie.discover:
                  return const Text('Discover Anime');
              case TypeMovie.popular:
                  return const Text('Discover Movie');                
            }
          }
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: PagedListView.separated(
        padding: const EdgeInsets.all(16.0),
        pagingController: _pagingController, 
        builderDelegate: PagedChildBuilderDelegate<MovieModel>(
          itemBuilder: (context, item, index) => ItemMovieWidget(
            movie: item,
            heightBackdrop: 260,
            widthBackdrop: double.infinity,
            heightPoster: 140,
            widthPoster: 80,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) {
                  return MovieDetailPage(id: item.id);
                },
              ));
            }
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ), 
    );
  }

  @override
  void dispose(){
    _pagingController.dispose();
    super.dispose();
  }
}