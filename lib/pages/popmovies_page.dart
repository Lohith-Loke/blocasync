// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:blocasync/Models/movie.dart';
import 'package:blocasync/popularmovie_bloc/popularmovie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PopMoviesPage extends StatelessWidget {
  const PopMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: BlocBuilder<PopularmovieCubit, PopularmovieState>(
          builder: (context, state) {
        print("widget built ");
        // return Text(state.toString());
        switch (state.isloading) {
          case true:
            // show loading screen
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.greenAccent.shade400,
                size: 200,
              ),
            );
          case false:
            //  check data arived of not
            if (state.isdataready) {
              //  render Movies screen
              // print(m.image);

              // return Text("hello ");
              return Listmaker(state.list);
            } else {
              // render error screen
              return Center(
                child: Text(
                  "error${state.error}",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                ),
              );
            }

          default:
            return Center(
              child: Text("error"),
            );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PopularmovieCubit>().loaddata();
        },
        heroTag: null,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  StatelessWidget Listmaker(List<MovieModel>? list) {
    if (list != null) {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Moviewidget(list[index]),

          ]);
        },
      );
    } else {
      return Text("error ");
    }
  }

  Widget Moviewidget(MovieModel m) {
    // var boxDecoration = BoxDecoration(
    //   border: Border(
    //     top: BorderSide(
    //       color: Colors.red,
    //       width: 3.0,
    //     ),
    //     bottom: BorderSide(
    //       color: Colors.red,
    //       width: 3.0,
    //     ),
    //     left: BorderSide(
    //       color: Colors.red,
    //       width: 3.0,
    //     ),
    //     right: BorderSide(
    //       color: Colors.red,
    //       width: 3.0,
    //     ),
    //   ),
    // );
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 34, 0, 40),
              offset: Offset(5, 5),
              blurRadius: 10.0,
              spreadRadius: 2.0),
          BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255),
              offset: Offset(0, 0),
              blurRadius: 0.0,
              spreadRadius: 0.0)
        ],
      ),
      padding: EdgeInsets.only(bottom: 40, top: 50, left: 10, right: 10),
      child: SizedBox(
        child: Row(
          children: [
            // 135 * 210
            // image box
            SizedBox(
              width: 135,
              height: 210,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  m.image ??
                      "https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_Ratio0.7015_AL_.jpg",
                  fit: BoxFit.cover,
                  height: 150,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            //  Text details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title  year
                Row(
                  children: [
                    Text(
                      overflow: TextOverflow.clip,
                      "${m.title}",
                      style: TextStyle(fontSize: 17, color: Colors.deepPurple),
                    ),
                    Text(
                      "(${m.year})",
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 11),
                    )
                  ],
                ),
                // Rank imdb rating
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "Rank :${m.rank} (",
                        ),
                        if (m.rankUpDown![0] == "+") ...[
                          Icon(Icons.arrow_drop_up,
                              size: 30, color: Colors.green),
                        ] else ...[
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.red,
                          ),
                        ],
                        Text(
                            textAlign: TextAlign.start,
                            "${m.rankUpDown!.substring(1)})")
                      ],
                    ),
                    if (m.imDbRating == "")
                      ...[]
                    else ...[
                      SizedBox(
                        width: 60,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            "${m.imDbRating}",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            "${m.imDbRatingCount})",
                            style: TextStyle(
                                fontSize: 9, color: Colors.grey.shade900),
                          )
                        ],
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
