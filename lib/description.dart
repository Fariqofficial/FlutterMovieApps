import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_apps/utils/text.dart';

class Description extends StatelessWidget {

  final String name, desc, bannerUrl, posterUrl, vote, launchOn;

  const Description({Key? key, required this.name, required this.desc, required this.bannerUrl, required this.posterUrl, required this.vote, required this.launchOn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          child: ListView(
            children: [
              Container(
                height: 250,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                        height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(bannerUrl, fit: BoxFit.cover),
                        )),
                      Positioned(
                          bottom: 10,
                          child: modiffied_text(text: ' ⭐ Rating : '+vote, color: Colors.yellow, size: 18))
                    ],
                  ),
              ),
              SizedBox(
                height: 15),
              Container(padding: EdgeInsets.all(10),
              child: modiffied_text(text: name != null? name: 'Not Loaded', color: Colors.white, size: 24)),
              Container(padding: EdgeInsets.only(left: 10),
              child: modiffied_text(text: 'Released Date : '+launchOn, color: Colors.white, size: 14)),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 300,
                    width: 150,
                    child: Image.network(posterUrl),
                  ),
                  Flexible(child: Container(
                    child: modiffied_text(text: desc, color: Colors.white, size: 18),
                  ))
                ],
              )],
          ),
        ),
    );
  }
}
