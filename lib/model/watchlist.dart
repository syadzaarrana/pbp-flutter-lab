// To parse this JSON data, do
//
//     final watchlist = watchlistFromJson(jsonString);

import 'dart:convert';

List<Watchlist> watchlistFromJson(String str) =>
    List<Watchlist>.from(json.decode(str).map((x) => Watchlist.fromJson(x)));

String watchlistToJson(List<Watchlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Watchlist {
  Watchlist({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  String watched;
  String title;
  double rating;
  String releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watched: json["watched"],
        title: json["title"],
        rating: json["rating"].toDouble(),
        releaseDate: json["release_date"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "watched": watched,
        "title": title,
        "rating": rating,
        "release_date": releaseDate,
        "review": review,
      };
}
