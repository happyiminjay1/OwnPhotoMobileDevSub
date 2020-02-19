class PDate {
  int count;
  //String next;
  //String previous;
  List<DResults> results;

  PDate(
      {
       this.count,
        //this.next,
        //this.previous,
        this.results,
      });

  factory PDate.fromJson(Map<String, dynamic> parsedJson) {
    var cnt=parsedJson['count'] as int;
    var list = parsedJson['results'] as List;
    List<DResults> resultsList = list.map((i) => DResults.fromJson(i)).toList();
    return PDate(
      //next: json["next"],
      //previous: json["previous"],
      results: resultsList,
     count: cnt,
    );
  }
}

class DResults {
  //int id;
  List<Photos> photos;
  String time;
  //String title;
  //int photocount;
  DResults(
      {
        //this.id,
        //this.coverphotos,
        this.photos,
        this.time
        //this.title,
        //this.photocount,
      });

  factory DResults.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['photos'] as List;
    var date= parsedJson['date'] as String;
    List<Photos> photosList = list.map((i) => Photos.fromJson(i)).toList();
    return DResults(
      //id: json["id"],
      photos: photosList,
      time:date,
      //photocount: json["photo_count"],
    );
  }
}

class Photos {
  String imagehash;
  //String exif_timestamp;

  Photos(
      {
        this.imagehash,
        //this.exif_timestamp,
      });

  factory Photos.fromJson(Map<String, dynamic> parsedJson) {
    return Photos(
      imagehash: parsedJson["image_hash"],
      //exif_timestamp: parsedJson["exif_timestamp"],
    );
  }
}