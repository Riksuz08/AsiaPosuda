class SubCategoryData{
  late  int id;
  late String name;
  late String? image;
  late int parent;
  late String display;
  late int count;
  late String slug;

  SubCategoryData({
    required this.id,
    required this.name,
    required this.image,
    required this.parent,
    required this.display,
    required this.count,
    required this.slug
  });
  factory SubCategoryData.fromJson(Map<String,dynamic> json)=> SubCategoryData(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] != '' ? json['image'] as String? : 'https://asiaposuda.uz/wp-content/uploads/2023/08/cropped-bez-imeni-1.png',
      parent: json['parent'] as int,
      display: json['display'] as String,
      count: json['count'] as int,
      slug: json['slug'] as String
  );

}