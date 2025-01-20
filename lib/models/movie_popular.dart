class MoviePopular {
   /*
    id : "id":762509,
  	path :"poster_path":"/jbOSUAWMGzGL1L4EaUF8K6zYFo7.jpg",
		"title":"Mufasa: The Lion King",
    "overview":"Mufasa, a cub lost and alone, meets a sympathetic lion named Taka, the heir to a royal bloodline. The chance meeting sets in motion an expansive journey of a group of misfits searching for their destiny.",
	  genre_ids 	"genre_ids":[12,10751,16],
    */ 

    final String title, path, overview;
    final int id;
    final List<int> genre;
    
    MoviePopular.fromJson(Map<String,dynamic> json):
      title = json['title'],
      path = json['poster_path'],
      id = json['id'],
      overview = json['overview'],
      genre=  List<int>.from(json['genre_ids'].map((x) => x as int));
}