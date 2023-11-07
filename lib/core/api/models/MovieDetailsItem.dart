class MovieDetailsItem {
  MovieDetailsItem({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget,
      this.homepage, 
      this.id, 
      this.imdbId,
      this.revenue, 
      this.runtime,
      this.status, 
      this.tagline, });

  MovieDetailsItem.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'];
    tagline = json['tagline'];
  }
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  String? homepage;
  int? id;
  String? imdbId;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
}