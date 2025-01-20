import 'package:flutter/material.dart';
import 'package:webtoonhw/models/movie_detail.dart';
import 'package:webtoonhw/services/api_service.dart';
import 'package:webtoonhw/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, path, overview;
  final int id;
  final List<int> genre;

  const DetailScreen({
    super.key,
    required this.title,
    required this.path,
    required this.id,
    required this.overview,
    required this.genre,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movieDetails;
  @override
  void initState() {
    super.initState();
    movieDetails = ApiService.getMovieDetailById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.5,
            child: Transform.scale(
              scale: 1.4,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${widget.path}",
                headers: const {
                  'User-Agent':
                      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
                },
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 30,
                  weight: 600,
                ),
                elevation: 0,
                title: const Text(
                  "Back to list",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 230, 10, 40),
                color: Colors.transparent,
                child: FutureBuilder(
                  future: movieDetails,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.title,
                            style: const TextStyle(
                              letterSpacing: 0,
                              wordSpacing: 0,
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.none, 
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              for(int i =1 ; i<=5 ; i++)
                              ...[
                                Icon(
                                  Icons.star, 
                                  color: i<=(snapshot.data!.rate~/2)? Colors.yellow :Colors.grey,
                                   size: 35,
                                   ),
                              ]
                              
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  ((snapshot.data!.runtime ~/ 60)>0?"${(snapshot.data!.runtime ~/60).toString()}h ":"")
                                  +
                                  (snapshot.data!.runtime % 60 != 0 ?"${(snapshot.data!.runtime % 60).toString()}min ":""),
                                  style: TextStyle(
                                    decoration: TextDecoration.none, 
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  "| ",
                                  style: TextStyle(
                                    decoration: TextDecoration.none, 
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                if(snapshot.data!.genre.isNotEmpty)
                                ...[
                                                                  for (var i = 0;
                                    i < snapshot.data!.genre.length;
                                    i++) ...[
                                  Text(
                                    snapshot.data!.genre[i]["name"],
                                    style: TextStyle(
                                      decoration: TextDecoration.none, 
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  if (i != snapshot.data!.genre.length - 1)
                                    Text(
                                      ", ",
                                      style: TextStyle(
                                        decoration: TextDecoration.none, 
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                ],
                                ]
                                else Text(
                                      "etc.",
                                      style: TextStyle(
                                        decoration: TextDecoration.none, 
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text(
                            "Storyline",
                            style: TextStyle(
                              decoration: TextDecoration.none, 
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            snapshot.data!.overview,
                            style: const TextStyle(
                              decoration: TextDecoration.none, 
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Episode(homepagelink: snapshot.data!.homepagelink),
                        ],
                      );
                    }
                    return const Text("....");
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

