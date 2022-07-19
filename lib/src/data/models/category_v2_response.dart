class CategoryV2Response {
  List<Categories>? categories;
  String? count;

  CategoryV2Response({this.categories, this.count});

  CategoryV2Response.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Categories {
  String? id;
  String? slug;
  String? parentId;
  String? image;
  Description? description;
  Description? title;
  String? orderNo;
  bool? active;
  List<Products>? products;
  bool? isChecked;

  Categories(
      {this.id,
        this.slug,
        this.parentId,
        this.image,
        this.description,
        this.title,
        this.orderNo,
        this.active,
        this.products,
        this.isChecked,});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    parentId = json['parent_id'];
    image = json['image'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    orderNo = json['order_no'];
    active = json['active'];
    isChecked = false;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    data['image'] = image;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['order_no'] = orderNo;
    data['active'] = active;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Description {
  String? uz;
  String? ru;
  String? en;

  Description({this.uz, this.ru, this.en});

  Description.fromJson(Map<String, dynamic> json) {
    uz = json['uz'];
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uz'] = uz;
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}

class Products {
  String? id;
  int? outPrice;
  String? currency;
  String? string;
  String? type;
  List<String>? categories;
  String? brandId;
  String? rateId;
  String? image;
  dynamic gallery;
  Description? title;
  Description? description;
  bool? active;
  String? iikoId;
  String? jowiId;

  Products(
      {this.id,
        this.outPrice,
        this.currency,
        this.string,
        this.type,
        this.categories,
        this.brandId,
        this.rateId,
        this.image,
        this.gallery,
        this.title,
        this.description,
        this.active,
        this.iikoId,
        this.jowiId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    outPrice = json['out_price'];
    currency = json['currency'];
    string = json['string'];
    type = json['type'];
    categories = json['categories'].cast<String>();
    brandId = json['brand_id'];
    rateId = json['rate_id'];
    image = json['image'];
    gallery = json['gallery'];
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    active = json['active'];
    iikoId = json['iiko_id'];
    jowiId = json['jowi_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['out_price'] = outPrice;
    data['currency'] = currency;
    data['string'] = string;
    data['type'] = type;
    data['categories'] = categories;
    data['brand_id'] = brandId;
    data['rate_id'] = rateId;
    data['image'] = image;
    data['gallery'] = gallery;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['active'] = active;
    data['iiko_id'] = iikoId;
    data['jowi_id'] = jowiId;
    return data;
  }
}