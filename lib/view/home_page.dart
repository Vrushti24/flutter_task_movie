import 'package:flutter/material.dart';
import 'package:flutter_task_movie/modal/movie_modal.dart';
import 'package:flutter_task_movie/service/api_service.dart';
import 'package:flutter_task_movie/widgets/app_bar.dart';
import 'package:flutter_task_movie/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //define a future list to fetch movies from API
  late Future<List<Movie>> newMovies;

  @override
  void initState() {
    super.initState();
    //initialize the future from service class
    newMovies = ApiService().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(233, 159, 245, 235),
      appBar: appBarItems(context: context),
      body: FutureBuilder(
        future: newMovies,
        builder: (context, snapshot) {
          //if error show error message
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          //if data fetched as expected then display the list
          else if (snapshot.hasData) {
            final movies = snapshot.data as List<Movie>;
            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = movies[index];
                  //display the movieCard
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MovieCard(movie: movie),
                  );
                });
          } else {
            //while fetching data show loading symbol
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
