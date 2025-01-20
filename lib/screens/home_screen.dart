import 'package:flutter/material.dart';
import 'package:webtoonhw/models/movie_popular.dart';
import 'package:webtoonhw/services/api_service.dart';
import 'package:webtoonhw/widgets/movie_popular.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<MoviePopular>> popMovies = ApiService.getPopularMovies();
  final Future<List<MoviePopular>> nowPlayingMovies =
      ApiService.getNowPlayingMovies();
  final Future<List<MoviePopular>> commingSoonMovies =
      ApiService.getCommingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 150, 0, 20),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Popular Movies',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: popMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 250,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var moviePop = snapshot.data![index];
                          return PopMovie(
                            title: moviePop.title,
                            path: moviePop.path,
                            id: moviePop.id,
                            overview: moviePop.overview,
                            genre: moviePop.genre,
                            height: 245,
                            width: 360,
                            hasTitle: false,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 20),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Now In Cinemas',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: nowPlayingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 270,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var movieNow = snapshot.data![index];
                          return PopMovie(
                            title: movieNow.title,
                            path: movieNow.path,
                            id: movieNow.id,
                            overview: movieNow.overview,
                            genre: movieNow.genre,
                            height: 190,
                            width: 190,
                            hasTitle: true,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 20),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Comming soon',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: commingSoonMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 280,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var movieNow = snapshot.data![index];
                          return PopMovie(
                            title: movieNow.title,
                            path: movieNow.path,
                            id: movieNow.id,
                            overview: movieNow.overview,
                            genre: movieNow.genre,
                            height: 250,
                            width: 190,
                            hasTitle: false,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 20),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
