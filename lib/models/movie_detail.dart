class MovieDetailModel {
    final String title,homepagelink, overview;
    final int id, runtime;
    final double rate;
    final List<dynamic> genre;
      /*
      "title":"Mufasa: The Lion King",
      "id":762509,
      "runtime":118,
      "genres":[{"id":12,"name":"Adventure"},
      {"id":10751,"name":"Family"},
      {"id":16,"name":"Animation"}
      "homepage":"https://movies.disney.com/mufasa-the-lion-king",
      "vote_average":7.372,
      "overview":"Mufasa, a cub lost and alone, meets a sympathetic lion named Taka, the heir to a royal bloodline. The chance meeting sets in motion an expansive journey of a group of misfits searching for their destiny.",

      ],
      */ 

    MovieDetailModel.fromJson(Map<String,dynamic> json):
      title = json['title'],
      id = json['id'],
      runtime =json['runtime'],
      genre = json['genres'],
      homepagelink =json['homepage'],
      rate = json['vote_average'],
      overview = json['overview'];

}