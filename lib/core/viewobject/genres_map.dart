import 'package:movie_demo/core/viewobject/movie_data.dart';

class MoviesGenres {
  static String getGenres(Movie movie) {
    List<String> genres = [];

    movie.genreIds?.forEach((id) {
      for (var m in [
        {28: 'Action'},
        {12: 'Adventure'},
        {16: 'Animation'},
        {35: 'Comedy'},
        {99: 'Documentary'},
        {18: 'Drama'},
        {14: 'Fantasy'},
        {36: 'History'},
        {27: 'Horror'},
        {10402: 'Music'},
        {9648: 'Mystery'},
        {10749: 'Romance'},
        {878: 'Science Fiction'},
        {10770: 'TV Movie'},
        {53: 'Thriller'},
        {10752: 'War'},
        {37: 'Western'},
        {10759: "Action & Adventure"},
        {80: "Crime"},
        {10751: "Family"},
        {10762: "Kids"},
        {10763: "News"},
        {10764: "Reality"},
        {10765: "Sci-Fi & Fantasy"},
        {10766: "Soap"},
        {10767: "Talk"},
        {10768: "War & Politics"},
        {37: "Western"}
      ]) {
        m.keys.first == id ? genres.add(m.values.first) : null;
      }
    });
    return genres.isEmpty ? 'N/A' : genres.take(5).join(', ');
  }
}
