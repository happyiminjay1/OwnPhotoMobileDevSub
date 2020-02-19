class PhotoList
{
  List<AllphotoResults> results;
  PhotoList
  ({
    this.results,
  });
  
  factory PhotoList.fromJson(Map<String,dynamic> parsedJson)
  {
    var list = parsedJson['results'] as List;
    List<AllphotoResults> resultsList = list.map((i) => AllphotoResults.fromJson(i)).toList();
    return PhotoList(
        results: resultsList,
    );
  }
  
}
class AllphotoResults
  {
    String imagehash;
    AllphotoResults
    (
      {this.imagehash,}
    );
    factory AllphotoResults.fromJson(Map<String,dynamic> parsedJson)
    {
      return AllphotoResults(
        imagehash:parsedJson["image_hash"],
      );
    }
  }