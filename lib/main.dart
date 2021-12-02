import 'package:flutter/material.dart';
import 'package:flutter_movie_apps/utils/text.dart';
import 'package:flutter_movie_apps/widget/topRated.dart';
import 'package:flutter_movie_apps/widget/trending.dart';
import 'package:flutter_movie_apps/widget/tvShows.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.lightBlue),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final String apiKey = '53dfb549888d4049003b94fcd2f98cd4';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1M2RmYjU0OTg4OGQ0MDQ5MDAzYjk0ZmNkMmY5OGNkNCIsInN1YiI6IjVjODMyNjdkYzNhMzY4NGU4ZmQ5NTQ3YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Xyvk61YIWKZwmTkQBSizrZ1-63Gc9n_6QI6YIeXZgB8';

  List trendingMovies = [];
  List topratedMovies = [];
  List tvShows = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
            showLogs: true,
            showErrorLogs: true));

    Map trendingResult = await tmdbCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbCustomLogs.v3.movies.getTopRated();
    Map tvshowsResult = await tmdbCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingMovies = trendingResult['results'];
      topratedMovies = topRatedResult['results'];
      tvShows = tvshowsResult['results'];
    });
    print(topratedMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: modiffied_text(text: 'Flutter Movie Apps', color: Colors.white, size: 16),
        backgroundColor: Colors.transparent),
      body: ListView(
        children: [
          TvShows(tvShows: tvShows),
          TopRated(topRated: topratedMovies),
          TrendingMovies(trending: trendingMovies)
        ],
      ),
    );
  }
}
