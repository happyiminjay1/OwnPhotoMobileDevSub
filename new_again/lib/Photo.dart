class Photo {
  //int count;
  //String next;
  //String previous;
  List<Results> results;


  Photo(
      {
       //this.count,
       //this.next,
       //this.previous,
       this.results,
      });

  factory Photo.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    List<Results> resultsList = list.map((i) => Results.fromJson(i)).toList();
    return Photo(
        //next: json["next"],
        //previous: json["previous"],
        results: resultsList,
        //count: json["count"],
    );
  }
}

class Results {
  //int id;
  List<CoverPhotos> coverphotos;
  String title;
  //int photocount;
  Results(
      {
       //this.id,
       //this.coverphotos,
       this.coverphotos,
       this.title,
       //this.photocount,
      });

  factory Results.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['cover_photos'] as List;
    List<CoverPhotos> coverphotosList = list.map((i) => CoverPhotos.fromJson(i)).toList();
    return Results(
        //id: json["id"],
        coverphotos: coverphotosList,
        title: parsedJson["title"],
        //photocount: json["photo_count"],
    );
  }
}

class CoverPhotos {
  String imagehash;
  CoverPhotos(
      {
        this.imagehash,
      });

  factory CoverPhotos.fromJson(Map<String, dynamic> parsedJson) {
    return CoverPhotos(
        imagehash: parsedJson["image_hash"],
    );
  }
}
