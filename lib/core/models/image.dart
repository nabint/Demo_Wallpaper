class ImageModel {
  late String id;
  late String? description;
  late String imageUrl;

  ImageModel(
      {required this.id, required this.description, required this.imageUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'] != null
        ? json['description']
        : json['alt_description'];
    this.imageUrl = json['urls']['regular'];
  }
}
