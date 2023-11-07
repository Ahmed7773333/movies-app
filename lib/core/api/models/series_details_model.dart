class SeriesDetailsModel {
  SeriesDetailsModel({
      this.inProduction,
      this.lastAirDate, 
      this.lastEpisodeToAir,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.seasons,
      this.status, 
      this.tagline, 
      this.type,});

  SeriesDetailsModel.fromJson(dynamic json) {
    inProduction = json['in_production'];
    lastAirDate = json['last_air_date'];
    lastEpisodeToAir = json['last_episode_to_air'] != null ? LastEpisodeToAir.fromJson(json['last_episode_to_air']) : null;
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    if (json['seasons'] != null) {
      seasons = [];
      json['seasons'].forEach((v) {
        seasons?.add(Seasons.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
  }
  bool? inProduction;
  String? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<Seasons>? seasons;
  String? status;
  String? tagline;
  String? type;
}

class Seasons {
  Seasons({
      this.airDate, 
      this.episodeCount, 
      this.id, 
      this.name, 
      this.overview, 
      this.posterPath, 
      this.seasonNumber, 
      this.voteAverage,});

  Seasons.fromJson(dynamic json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
    voteAverage = json['vote_average'];
  }
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;
  int? voteAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = airDate;
    map['episode_count'] = episodeCount;
    map['id'] = id;
    map['name'] = name;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['season_number'] = seasonNumber;
    map['vote_average'] = voteAverage;
    return map;
  }

}

class LastEpisodeToAir {
  LastEpisodeToAir({
      this.id, 
      this.name, 
      this.overview, 
      this.voteAverage, 
      this.voteCount, 
      this.airDate, 
      this.episodeNumber, 
      this.episodeType, 
      this.productionCode, 
      this.runtime, 
      this.seasonNumber, 
      this.showId, 
      this.stillPath,});

  LastEpisodeToAir.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    episodeType = json['episode_type'];
    productionCode = json['production_code'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = json['still_path'];
  }
  int? id;
  String? name;
  String? overview;
  double? voteAverage;
  int? voteCount;
  String? airDate;
  int? episodeNumber;
  String? episodeType;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['overview'] = overview;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['air_date'] = airDate;
    map['episode_number'] = episodeNumber;
    map['episode_type'] = episodeType;
    map['production_code'] = productionCode;
    map['runtime'] = runtime;
    map['season_number'] = seasonNumber;
    map['show_id'] = showId;
    map['still_path'] = stillPath;
    return map;
  }

}