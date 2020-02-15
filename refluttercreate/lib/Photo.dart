class Photo {
  String count;
  String next;
  String previous;
  Results results;

  Photo(
      {this.count,
       this.next,
       this.previous,
       this.results,
      });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        next: json["next"],
        previous: json["previous"],
        results: Results.fromJson(json["results"]),
        count: json["count"],
    );
  }
}

class Results {
  String id;
  CoverPhotos coverphotos;
  String title;
  String photocount;

  Results(
      {this.id,
       this.coverphotos,
       this.title,
       this.photocount,
      });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        id: json["id"] as String,
        coverphotos: CoverPhotos.fromJson(json["cover_photos"]),
        title: json["title"] as String,
        photocount: json["photo_count"] as String,
    );
  }
}

class CoverPhotos {
  String imagehash;
  CoverPhotos(
      {
        this.imagehash,
      });

  factory CoverPhotos.fromJson(Map<String, dynamic> json) {
    return CoverPhotos(
        imagehash: json["image_hash"],
    );
  }
}