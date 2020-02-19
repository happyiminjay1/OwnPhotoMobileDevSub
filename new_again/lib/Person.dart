class Person {
  //int count;
  //String next;
  //String previous;
  List<PersonResults> results;


  Person(
      {
       //this.count,
       //this.next,
       //this.previous,
       this.results,
      });

  factory Person.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    List<PersonResults> resultsList = list.map((i) => PersonResults.fromJson(i)).toList();
    return Person(
        //next: json["next"],
        //previous: json["previous"],
        results: resultsList,
        //count: json["count"],
    );
  }
}

class PersonResults {
  //int id;
  List<PersonPhotos> personPhotos;
  String name;
  //int Personcount;
  PersonResults(
      {
       //this.id,
       //this.Person_Photos,
       this.name,
       this.personPhotos,
       //this.title,
       //this.Personcount,
      });

  factory PersonResults.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['photos'] as List;
    List<PersonPhotos> photosList = list.map((i) => PersonPhotos.fromJson(i)).toList();
    return PersonResults(
        //id: json["id"],
        name: parsedJson["name"],
        personPhotos: photosList,

        //title: json["title"] as String,
        //Personcount: json["Person_count"],
    );
  }
}

class PersonPhotos {
  String imagehash;
  PersonPhotos(
      {
        this.imagehash,
      });

  factory PersonPhotos.fromJson(Map<String, dynamic> parsedJson) {
    return PersonPhotos(
        imagehash: parsedJson["image_hash"],
    );
  }
}