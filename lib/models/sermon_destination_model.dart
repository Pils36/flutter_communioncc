class SermonDestinationModel {
  String name;
  String country;
  String image;

  SermonDestinationModel(this.name, this.country, this.image);
}

List<SermonDestinationModel> sermons = sermonsData
    .map((item) =>
        SermonDestinationModel(item['name'], item['country'], item['image']))
    .toList();

var sermonsData = [
  {
    "name": "Bali",
    "country": "Indonesia",
    "image": "assets/images/destination_bali.jpg"
  },
  {
    "name": "Paris",
    "country": "France",
    "image": "assets/images/destination_paris.jpg"
  },
  {
    "name": "Rome",
    "country": "Italy",
    "image": "assets/images/destination_rome.jpg"
  },
  {
    "name": "New York",
    "country": "USA",
    "image": "assets/images/destination_newyork.jpg"
  },
];
