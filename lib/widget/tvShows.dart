import 'package:flutter/material.dart';
import 'package:flutter_movie_apps/utils/text.dart';

import '../description.dart';

class TvShows extends StatelessWidget {

  final List tvShows;

  const TvShows({Key? key, required this.tvShows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modiffied_text(
              text: 'TV Shows', size: 26, color: Colors.white),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tvShows.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> Description(
                                name: tvShows[index]['original_name'],
                                bannerUrl: 'https://image.tmdb.org/t/p/w500'+tvShows[index]['backdrop_path'],
                                posterUrl: 'https://image.tmdb.org/t/p/w500'+tvShows[index]['poster_path'],
                                desc: tvShows[index]['overview'],
                                vote: tvShows[index]['vote_average'].toString(),
                                launchOn: tvShows[index]['first_air_date'])));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              width: 250,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tvShows[index]['backdrop_path']),
                                fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modiffied_text(
                                  size: 15,
                                  color: Colors.white,
                                  text: tvShows[index]['original_name'] != null
                                      ? tvShows[index]['original_name']
                                      : 'Loading'),
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
