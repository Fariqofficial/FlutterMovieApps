import 'package:flutter/material.dart';
import 'package:flutter_movie_apps/utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List topRated;

  const TopRated({Key? key, required this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modiffied_text(
              text: 'Top Rated Movies', size: 26, color: Colors.white),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topRated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> Description(
                                name: topRated[index]['title'],
                                bannerUrl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path'],
                                posterUrl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path'],
                                desc: topRated[index]['overview'],
                                vote: topRated[index]['vote_average'].toString(),
                                launchOn: topRated[index]['release_date'])));
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            topRated[index]['poster_path'])),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modiffied_text(
                                  size: 15,
                                  color: Colors.white,
                                  text: topRated[index]['title'] != null
                                      ? topRated[index]['title']
                                      : 'Loading'),
                            )
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
