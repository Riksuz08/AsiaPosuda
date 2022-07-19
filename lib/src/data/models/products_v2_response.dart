class ProductsV2Response {
  ProductsV2Response({
      String? count, 
      List<Products>? products,}){
    _count = count;
    _products = products;
}

  ProductsV2Response.fromJson(dynamic json) {
    _count = json['count'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  String? _count;
  List<Products>? _products;
ProductsV2Response copyWith({  String? count,
  List<Products>? products,
}) => ProductsV2Response(  count: count ?? _count,
  products: products ?? _products,
);
  String? get count => _count;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Products {
  Products({
      bool? active, 
      Brand? brand, 
      List<Categories>? categories, 
      String? code, 
      String? count, 
      String? currency, 
      Description? description, 
      List<Favorites>? favorites, 
      List<String>? gallery, 
      String? id, 
      String? iikoId, 
      String? image, 
      int? inPrice, 
      bool? isDivisible, 
      String? jowiId, 
      Measurement? measurement, 
      String? order, 
      int? outPrice, 
      List<PriceChangers>? priceChangers, 
      List<ProductProperty>? productProperty, 
      List<Properties>? properties, 
      Rate? rate, 
      String? slug, 
      List<Tags>? tags, 
      Title? title, 
      List<VariantProducts>? variantProducts,}){
    _active = active;
    _brand = brand;
    _categories = categories;
    _code = code;
    _count = count;
    _currency = currency;
    _description = description;
    _favorites = favorites;
    _gallery = gallery;
    _id = id;
    _iikoId = iikoId;
    _image = image;
    _inPrice = inPrice;
    _isDivisible = isDivisible;
    _jowiId = jowiId;
    _measurement = measurement;
    _order = order;
    _outPrice = outPrice;
    _priceChangers = priceChangers;
    _productProperty = productProperty;
    _properties = properties;
    _rate = rate;
    _slug = slug;
    _tags = tags;
    _title = title;
    _variantProducts = variantProducts;
}

  Products.fromJson(dynamic json) {
    _active = json['active'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    _code = json['code'];
    _count = json['count'];
    _currency = json['currency'];
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    if (json['favorites'] != null) {
      _favorites = [];
      json['favorites'].forEach((v) {
        _favorites?.add(Favorites.fromJson(v));
      });
    }
    _gallery = json['gallery'] != null ? json['gallery'].cast<String>() : [];
    _id = json['id'];
    _iikoId = json['iiko_id'];
    _image = json['image'];
    _inPrice = json['in_price'];
    _isDivisible = json['is_divisible'];
    _jowiId = json['jowi_id'];
    _measurement = json['measurement'] != null ? Measurement.fromJson(json['measurement']) : null;
    _order = json['order'];
    _outPrice = json['out_price'];
    if (json['price_changers'] != null) {
      _priceChangers = [];
      json['price_changers'].forEach((v) {
        _priceChangers?.add(PriceChangers.fromJson(v));
      });
    }
    if (json['product_property'] != null) {
      _productProperty = [];
      json['product_property'].forEach((v) {
        _productProperty?.add(ProductProperty.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    _rate = json['rate'] != null ? Rate.fromJson(json['rate']) : null;
    _slug = json['slug'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    if (json['variant_products'] != null) {
      _variantProducts = [];
      json['variant_products'].forEach((v) {
        _variantProducts?.add(VariantProducts.fromJson(v));
      });
    }
  }
  bool? _active;
  Brand? _brand;
  List<Categories>? _categories;
  String? _code;
  String? _count;
  String? _currency;
  Description? _description;
  List<Favorites>? _favorites;
  List<String>? _gallery;
  String? _id;
  String? _iikoId;
  String? _image;
  int? _inPrice;
  bool? _isDivisible;
  String? _jowiId;
  Measurement? _measurement;
  String? _order;
  int? _outPrice;
  List<PriceChangers>? _priceChangers;
  List<ProductProperty>? _productProperty;
  List<Properties>? _properties;
  Rate? _rate;
  String? _slug;
  List<Tags>? _tags;
  Title? _title;
  List<VariantProducts>? _variantProducts;
Products copyWith({  bool? active,
  Brand? brand,
  List<Categories>? categories,
  String? code,
  String? count,
  String? currency,
  Description? description,
  List<Favorites>? favorites,
  List<String>? gallery,
  String? id,
  String? iikoId,
  String? image,
  int? inPrice,
  bool? isDivisible,
  String? jowiId,
  Measurement? measurement,
  String? order,
  int? outPrice,
  List<PriceChangers>? priceChangers,
  List<ProductProperty>? productProperty,
  List<Properties>? properties,
  Rate? rate,
  String? slug,
  List<Tags>? tags,
  Title? title,
  List<VariantProducts>? variantProducts,
}) => Products(  active: active ?? _active,
  brand: brand ?? _brand,
  categories: categories ?? _categories,
  code: code ?? _code,
  count: count ?? _count,
  currency: currency ?? _currency,
  description: description ?? _description,
  favorites: favorites ?? _favorites,
  gallery: gallery ?? _gallery,
  id: id ?? _id,
  iikoId: iikoId ?? _iikoId,
  image: image ?? _image,
  inPrice: inPrice ?? _inPrice,
  isDivisible: isDivisible ?? _isDivisible,
  jowiId: jowiId ?? _jowiId,
  measurement: measurement ?? _measurement,
  order: order ?? _order,
  outPrice: outPrice ?? _outPrice,
  priceChangers: priceChangers ?? _priceChangers,
  productProperty: productProperty ?? _productProperty,
  properties: properties ?? _properties,
  rate: rate ?? _rate,
  slug: slug ?? _slug,
  tags: tags ?? _tags,
  title: title ?? _title,
  variantProducts: variantProducts ?? _variantProducts,
);
  bool? get active => _active;
  Brand? get brand => _brand;
  List<Categories>? get categories => _categories;
  String? get code => _code;
  String? get count => _count;
  String? get currency => _currency;
  Description? get description => _description;
  List<Favorites>? get favorites => _favorites;
  List<String>? get gallery => _gallery;
  String? get id => _id;
  String? get iikoId => _iikoId;
  String? get image => _image;
  int? get inPrice => _inPrice;
  bool? get isDivisible => _isDivisible;
  String? get jowiId => _jowiId;
  Measurement? get measurement => _measurement;
  String? get order => _order;
  int? get outPrice => _outPrice;
  List<PriceChangers>? get priceChangers => _priceChangers;
  List<ProductProperty>? get productProperty => _productProperty;
  List<Properties>? get properties => _properties;
  Rate? get rate => _rate;
  String? get slug => _slug;
  List<Tags>? get tags => _tags;
  Title? get title => _title;
  List<VariantProducts>? get variantProducts => _variantProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    map['code'] = _code;
    map['count'] = _count;
    map['currency'] = _currency;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    if (_favorites != null) {
      map['favorites'] = _favorites?.map((v) => v.toJson()).toList();
    }
    map['gallery'] = _gallery;
    map['id'] = _id;
    map['iiko_id'] = _iikoId;
    map['image'] = _image;
    map['in_price'] = _inPrice;
    map['is_divisible'] = _isDivisible;
    map['jowi_id'] = _jowiId;
    if (_measurement != null) {
      map['measurement'] = _measurement?.toJson();
    }
    map['order'] = _order;
    map['out_price'] = _outPrice;
    if (_priceChangers != null) {
      map['price_changers'] = _priceChangers?.map((v) => v.toJson()).toList();
    }
    if (_productProperty != null) {
      map['product_property'] = _productProperty?.map((v) => v.toJson()).toList();
    }
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    if (_rate != null) {
      map['rate'] = _rate?.toJson();
    }
    map['slug'] = _slug;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    if (_variantProducts != null) {
      map['variant_products'] = _variantProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class VariantProducts {
  VariantProducts({
      bool? active, 
      String? brandId, 
      List<String>? categories, 
      int? count, 
      String? currency, 
      Description? description, 
      List<String>? favourites, 
      List<String>? gallery, 
      String? iikoId, 
      String? image, 
      int? inPrice, 
      bool? isDivisible, 
      String? jowiId, 
      String? measurementId, 
      String? order, 
      int? outPrice, 
      String? parentId, 
      List<String>? priceChangers, 
      List<ProductProperty>? productProperty, 
      List<String>? propertyIds, 
      String? rateId, 
      String? relationType, 
      String? string, 
      List<String>? tags, 
      Title? title, 
      String? type,}){
    _active = active;
    _brandId = brandId;
    _categories = categories;
    _count = count;
    _currency = currency;
    _description = description;
    _favourites = favourites;
    _gallery = gallery;
    _iikoId = iikoId;
    _image = image;
    _inPrice = inPrice;
    _isDivisible = isDivisible;
    _jowiId = jowiId;
    _measurementId = measurementId;
    _order = order;
    _outPrice = outPrice;
    _parentId = parentId;
    _priceChangers = priceChangers;
    _productProperty = productProperty;
    _propertyIds = propertyIds;
    _rateId = rateId;
    _relationType = relationType;
    _string = string;
    _tags = tags;
    _title = title;
    _type = type;
}

  VariantProducts.fromJson(dynamic json) {
    _active = json['active'];
    _brandId = json['brand_id'];
    _categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    _count = json['count'];
    _currency = json['currency'];
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    _favourites = json['favourites'] != null ? json['favourites'].cast<String>() : [];
    _gallery = json['gallery'] != null ? json['gallery'].cast<String>() : [];
    _iikoId = json['iiko_id'];
    _image = json['image'];
    _inPrice = json['in_price'];
    _isDivisible = json['is_divisible'];
    _jowiId = json['jowi_id'];
    _measurementId = json['measurement_id'];
    _order = json['order'];
    _outPrice = json['out_price'];
    _parentId = json['parent_id'];
    _priceChangers = json['price_changers'] != null ? json['price_changers'].cast<String>() : [];
    if (json['product_property'] != null) {
      _productProperty = [];
      json['product_property'].forEach((v) {
        _productProperty?.add(ProductProperty.fromJson(v));
      });
    }
    _propertyIds = json['property_ids'] != null ? json['property_ids'].cast<String>() : [];
    _rateId = json['rate_id'];
    _relationType = json['relation_type'];
    _string = json['string'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _type = json['type'];
  }
  bool? _active;
  String? _brandId;
  List<String>? _categories;
  int? _count;
  String? _currency;
  Description? _description;
  List<String>? _favourites;
  List<String>? _gallery;
  String? _iikoId;
  String? _image;
  int? _inPrice;
  bool? _isDivisible;
  String? _jowiId;
  String? _measurementId;
  String? _order;
  int? _outPrice;
  String? _parentId;
  List<String>? _priceChangers;
  List<ProductProperty>? _productProperty;
  List<String>? _propertyIds;
  String? _rateId;
  String? _relationType;
  String? _string;
  List<String>? _tags;
  Title? _title;
  String? _type;
VariantProducts copyWith({  bool? active,
  String? brandId,
  List<String>? categories,
  int? count,
  String? currency,
  Description? description,
  List<String>? favourites,
  List<String>? gallery,
  String? iikoId,
  String? image,
  int? inPrice,
  bool? isDivisible,
  String? jowiId,
  String? measurementId,
  String? order,
  int? outPrice,
  String? parentId,
  List<String>? priceChangers,
  List<ProductProperty>? productProperty,
  List<String>? propertyIds,
  String? rateId,
  String? relationType,
  String? string,
  List<String>? tags,
  Title? title,
  String? type,
}) => VariantProducts(  active: active ?? _active,
  brandId: brandId ?? _brandId,
  categories: categories ?? _categories,
  count: count ?? _count,
  currency: currency ?? _currency,
  description: description ?? _description,
  favourites: favourites ?? _favourites,
  gallery: gallery ?? _gallery,
  iikoId: iikoId ?? _iikoId,
  image: image ?? _image,
  inPrice: inPrice ?? _inPrice,
  isDivisible: isDivisible ?? _isDivisible,
  jowiId: jowiId ?? _jowiId,
  measurementId: measurementId ?? _measurementId,
  order: order ?? _order,
  outPrice: outPrice ?? _outPrice,
  parentId: parentId ?? _parentId,
  priceChangers: priceChangers ?? _priceChangers,
  productProperty: productProperty ?? _productProperty,
  propertyIds: propertyIds ?? _propertyIds,
  rateId: rateId ?? _rateId,
  relationType: relationType ?? _relationType,
  string: string ?? _string,
  tags: tags ?? _tags,
  title: title ?? _title,
  type: type ?? _type,
);
  bool? get active => _active;
  String? get brandId => _brandId;
  List<String>? get categories => _categories;
  int? get count => _count;
  String? get currency => _currency;
  Description? get description => _description;
  List<String>? get favourites => _favourites;
  List<String>? get gallery => _gallery;
  String? get iikoId => _iikoId;
  String? get image => _image;
  int? get inPrice => _inPrice;
  bool? get isDivisible => _isDivisible;
  String? get jowiId => _jowiId;
  String? get measurementId => _measurementId;
  String? get order => _order;
  int? get outPrice => _outPrice;
  String? get parentId => _parentId;
  List<String>? get priceChangers => _priceChangers;
  List<ProductProperty>? get productProperty => _productProperty;
  List<String>? get propertyIds => _propertyIds;
  String? get rateId => _rateId;
  String? get relationType => _relationType;
  String? get string => _string;
  List<String>? get tags => _tags;
  Title? get title => _title;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    map['brand_id'] = _brandId;
    map['categories'] = _categories;
    map['count'] = _count;
    map['currency'] = _currency;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['favourites'] = _favourites;
    map['gallery'] = _gallery;
    map['iiko_id'] = _iikoId;
    map['image'] = _image;
    map['in_price'] = _inPrice;
    map['is_divisible'] = _isDivisible;
    map['jowi_id'] = _jowiId;
    map['measurement_id'] = _measurementId;
    map['order'] = _order;
    map['out_price'] = _outPrice;
    map['parent_id'] = _parentId;
    map['price_changers'] = _priceChangers;
    if (_productProperty != null) {
      map['product_property'] = _productProperty?.map((v) => v.toJson()).toList();
    }
    map['property_ids'] = _propertyIds;
    map['rate_id'] = _rateId;
    map['relation_type'] = _relationType;
    map['string'] = _string;
    map['tags'] = _tags;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    map['type'] = _type;
    return map;
  }

}

class Title {
  Title({
      String? en, 
      String? ru, 
      String? uz,}){
    _en = en;
    _ru = ru;
    _uz = uz;
}

  Title.fromJson(dynamic json) {
    _en = json['en'];
    _ru = json['ru'];
    _uz = json['uz'];
  }
  String? _en;
  String? _ru;
  String? _uz;
Title copyWith({  String? en,
  String? ru,
  String? uz,
}) => Title(  en: en ?? _en,
  ru: ru ?? _ru,
  uz: uz ?? _uz,
);
  String? get en => _en;
  String? get ru => _ru;
  String? get uz => _uz;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = _en;
    map['ru'] = _ru;
    map['uz'] = _uz;
    return map;
  }

}

class ProductProperty {
  ProductProperty({
      String? propertyId, 
      String? value,}){
    _propertyId = propertyId;
    _value = value;
}

  ProductProperty.fromJson(dynamic json) {
    _propertyId = json['property_id'];
    _value = json['value'];
  }
  String? _propertyId;
  String? _value;
ProductProperty copyWith({  String? propertyId,
  String? value,
}) => ProductProperty(  propertyId: propertyId ?? _propertyId,
  value: value ?? _value,
);
  String? get propertyId => _propertyId;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property_id'] = _propertyId;
    map['value'] = _value;
    return map;
  }

}

class Description {
  Description({
      String? en, 
      String? ru, 
      String? uz,}){
    _en = en;
    _ru = ru;
    _uz = uz;
}

  Description.fromJson(dynamic json) {
    _en = json['en'];
    _ru = json['ru'];
    _uz = json['uz'];
  }
  String? _en;
  String? _ru;
  String? _uz;
Description copyWith({  String? en,
  String? ru,
  String? uz,
}) => Description(  en: en ?? _en,
  ru: ru ?? _ru,
  uz: uz ?? _uz,
);
  String? get en => _en;
  String? get ru => _ru;
  String? get uz => _uz;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = _en;
    map['ru'] = _ru;
    map['uz'] = _uz;
    return map;
  }

}

class Tags {
  Tags({
      String? color, 
      String? icon, 
      String? id, 
      String? slug, 
      Title? title,}){
    _color = color;
    _icon = icon;
    _id = id;
    _slug = slug;
    _title = title;
}

  Tags.fromJson(dynamic json) {
    _color = json['color'];
    _icon = json['icon'];
    _id = json['id'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }
  String? _color;
  String? _icon;
  String? _id;
  String? _slug;
  Title? _title;
Tags copyWith({  String? color,
  String? icon,
  String? id,
  String? slug,
  Title? title,
}) => Tags(  color: color ?? _color,
  icon: icon ?? _icon,
  id: id ?? _id,
  slug: slug ?? _slug,
  title: title ?? _title,
);
  String? get color => _color;
  String? get icon => _icon;
  String? get id => _id;
  String? get slug => _slug;
  Title? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['color'] = _color;
    map['icon'] = _icon;
    map['id'] = _id;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    return map;
  }

}

class Rate {
  Rate({
      String? code, 
      String? id, 
      String? rateAmount, 
      String? slug, 
      String? title,}){
    _code = code;
    _id = id;
    _rateAmount = rateAmount;
    _slug = slug;
    _title = title;
}

  Rate.fromJson(dynamic json) {
    _code = json['code'];
    _id = json['id'];
    _rateAmount = json['rate_amount'];
    _slug = json['slug'];
    _title = json['title'];
  }
  String? _code;
  String? _id;
  String? _rateAmount;
  String? _slug;
  String? _title;
Rate copyWith({  String? code,
  String? id,
  String? rateAmount,
  String? slug,
  String? title,
}) => Rate(  code: code ?? _code,
  id: id ?? _id,
  rateAmount: rateAmount ?? _rateAmount,
  slug: slug ?? _slug,
  title: title ?? _title,
);
  String? get code => _code;
  String? get id => _id;
  String? get rateAmount => _rateAmount;
  String? get slug => _slug;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['id'] = _id;
    map['rate_amount'] = _rateAmount;
    map['slug'] = _slug;
    map['title'] = _title;
    return map;
  }

}

class Properties {
  Properties({
      String? propertyId, 
      String? value,}){
    _propertyId = propertyId;
    _value = value;
}

  Properties.fromJson(dynamic json) {
    _propertyId = json['property_id'];
    _value = json['value'];
  }
  String? _propertyId;
  String? _value;
Properties copyWith({  String? propertyId,
  String? value,
}) => Properties(  propertyId: propertyId ?? _propertyId,
  value: value ?? _value,
);
  String? get propertyId => _propertyId;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property_id'] = _propertyId;
    map['value'] = _value;
    return map;
  }

}

class PriceChangers {
  PriceChangers({
      String? amount, 
      String? base, 
      String? changeType, 
      String? id, 
      String? slug, 
      Title? title,}){
    _amount = amount;
    _base = base;
    _changeType = changeType;
    _id = id;
    _slug = slug;
    _title = title;
}

  PriceChangers.fromJson(dynamic json) {
    _amount = json['amount'];
    _base = json['base'];
    _changeType = json['change_type'];
    _id = json['id'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }
  String? _amount;
  String? _base;
  String? _changeType;
  String? _id;
  String? _slug;
  Title? _title;
PriceChangers copyWith({  String? amount,
  String? base,
  String? changeType,
  String? id,
  String? slug,
  Title? title,
}) => PriceChangers(  amount: amount ?? _amount,
  base: base ?? _base,
  changeType: changeType ?? _changeType,
  id: id ?? _id,
  slug: slug ?? _slug,
  title: title ?? _title,
);
  String? get amount => _amount;
  String? get base => _base;
  String? get changeType => _changeType;
  String? get id => _id;
  String? get slug => _slug;
  Title? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['base'] = _base;
    map['change_type'] = _changeType;
    map['id'] = _id;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    return map;
  }

}

class Measurement {
  Measurement({
      int? accuracy, 
      String? id, 
      String? shortName, 
      String? slug, 
      Title? title,}){
    _accuracy = accuracy;
    _id = id;
    _shortName = shortName;
    _slug = slug;
    _title = title;
}

  Measurement.fromJson(dynamic json) {
    _accuracy = json['accuracy'];
    _id = json['id'];
    _shortName = json['short_name'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }
  int? _accuracy;
  String? _id;
  String? _shortName;
  String? _slug;
  Title? _title;
Measurement copyWith({  int? accuracy,
  String? id,
  String? shortName,
  String? slug,
  Title? title,
}) => Measurement(  accuracy: accuracy ?? _accuracy,
  id: id ?? _id,
  shortName: shortName ?? _shortName,
  slug: slug ?? _slug,
  title: title ?? _title,
);
  int? get accuracy => _accuracy;
  String? get id => _id;
  String? get shortName => _shortName;
  String? get slug => _slug;
  Title? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accuracy'] = _accuracy;
    map['id'] = _id;
    map['short_name'] = _shortName;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    return map;
  }

}

class Favorites {
  Favorites({
      bool? active, 
      String? brandId, 
      List<String>? categories, 
      int? count, 
      String? currency, 
      Description? description, 
      List<String>? favourites, 
      List<String>? gallery, 
      String? iikoId, 
      String? image, 
      int? inPrice, 
      bool? isDivisible, 
      String? jowiId, 
      String? measurementId, 
      String? order, 
      int? outPrice, 
      String? parentId, 
      List<String>? priceChangers, 
      List<ProductProperty>? productProperty, 
      List<String>? propertyIds, 
      String? rateId, 
      String? relationType, 
      String? string, 
      List<String>? tags, 
      Title? title, 
      String? type,}){
    _active = active;
    _brandId = brandId;
    _categories = categories;
    _count = count;
    _currency = currency;
    _description = description;
    _favourites = favourites;
    _gallery = gallery;
    _iikoId = iikoId;
    _image = image;
    _inPrice = inPrice;
    _isDivisible = isDivisible;
    _jowiId = jowiId;
    _measurementId = measurementId;
    _order = order;
    _outPrice = outPrice;
    _parentId = parentId;
    _priceChangers = priceChangers;
    _productProperty = productProperty;
    _propertyIds = propertyIds;
    _rateId = rateId;
    _relationType = relationType;
    _string = string;
    _tags = tags;
    _title = title;
    _type = type;
}

  Favorites.fromJson(dynamic json) {
    _active = json['active'];
    _brandId = json['brand_id'];
    _categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    _count = json['count'];
    _currency = json['currency'];
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    _favourites = json['favourites'] != null ? json['favourites'].cast<String>() : [];
    _gallery = json['gallery'] != null ? json['gallery'].cast<String>() : [];
    _iikoId = json['iiko_id'];
    _image = json['image'];
    _inPrice = json['in_price'];
    _isDivisible = json['is_divisible'];
    _jowiId = json['jowi_id'];
    _measurementId = json['measurement_id'];
    _order = json['order'];
    _outPrice = json['out_price'];
    _parentId = json['parent_id'];
    _priceChangers = json['price_changers'] != null ? json['price_changers'].cast<String>() : [];
    if (json['product_property'] != null) {
      _productProperty = [];
      json['product_property'].forEach((v) {
        _productProperty?.add(ProductProperty.fromJson(v));
      });
    }
    _propertyIds = json['property_ids'] != null ? json['property_ids'].cast<String>() : [];
    _rateId = json['rate_id'];
    _relationType = json['relation_type'];
    _string = json['string'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _type = json['type'];
  }
  bool? _active;
  String? _brandId;
  List<String>? _categories;
  int? _count;
  String? _currency;
  Description? _description;
  List<String>? _favourites;
  List<String>? _gallery;
  String? _iikoId;
  String? _image;
  int? _inPrice;
  bool? _isDivisible;
  String? _jowiId;
  String? _measurementId;
  String? _order;
  int? _outPrice;
  String? _parentId;
  List<String>? _priceChangers;
  List<ProductProperty>? _productProperty;
  List<String>? _propertyIds;
  String? _rateId;
  String? _relationType;
  String? _string;
  List<String>? _tags;
  Title? _title;
  String? _type;
Favorites copyWith({  bool? active,
  String? brandId,
  List<String>? categories,
  int? count,
  String? currency,
  Description? description,
  List<String>? favourites,
  List<String>? gallery,
  String? iikoId,
  String? image,
  int? inPrice,
  bool? isDivisible,
  String? jowiId,
  String? measurementId,
  String? order,
  int? outPrice,
  String? parentId,
  List<String>? priceChangers,
  List<ProductProperty>? productProperty,
  List<String>? propertyIds,
  String? rateId,
  String? relationType,
  String? string,
  List<String>? tags,
  Title? title,
  String? type,
}) => Favorites(  active: active ?? _active,
  brandId: brandId ?? _brandId,
  categories: categories ?? _categories,
  count: count ?? _count,
  currency: currency ?? _currency,
  description: description ?? _description,
  favourites: favourites ?? _favourites,
  gallery: gallery ?? _gallery,
  iikoId: iikoId ?? _iikoId,
  image: image ?? _image,
  inPrice: inPrice ?? _inPrice,
  isDivisible: isDivisible ?? _isDivisible,
  jowiId: jowiId ?? _jowiId,
  measurementId: measurementId ?? _measurementId,
  order: order ?? _order,
  outPrice: outPrice ?? _outPrice,
  parentId: parentId ?? _parentId,
  priceChangers: priceChangers ?? _priceChangers,
  productProperty: productProperty ?? _productProperty,
  propertyIds: propertyIds ?? _propertyIds,
  rateId: rateId ?? _rateId,
  relationType: relationType ?? _relationType,
  string: string ?? _string,
  tags: tags ?? _tags,
  title: title ?? _title,
  type: type ?? _type,
);
  bool? get active => _active;
  String? get brandId => _brandId;
  List<String>? get categories => _categories;
  int? get count => _count;
  String? get currency => _currency;
  Description? get description => _description;
  List<String>? get favourites => _favourites;
  List<String>? get gallery => _gallery;
  String? get iikoId => _iikoId;
  String? get image => _image;
  int? get inPrice => _inPrice;
  bool? get isDivisible => _isDivisible;
  String? get jowiId => _jowiId;
  String? get measurementId => _measurementId;
  String? get order => _order;
  int? get outPrice => _outPrice;
  String? get parentId => _parentId;
  List<String>? get priceChangers => _priceChangers;
  List<ProductProperty>? get productProperty => _productProperty;
  List<String>? get propertyIds => _propertyIds;
  String? get rateId => _rateId;
  String? get relationType => _relationType;
  String? get string => _string;
  List<String>? get tags => _tags;
  Title? get title => _title;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    map['brand_id'] = _brandId;
    map['categories'] = _categories;
    map['count'] = _count;
    map['currency'] = _currency;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['favourites'] = _favourites;
    map['gallery'] = _gallery;
    map['iiko_id'] = _iikoId;
    map['image'] = _image;
    map['in_price'] = _inPrice;
    map['is_divisible'] = _isDivisible;
    map['jowi_id'] = _jowiId;
    map['measurement_id'] = _measurementId;
    map['order'] = _order;
    map['out_price'] = _outPrice;
    map['parent_id'] = _parentId;
    map['price_changers'] = _priceChangers;
    if (_productProperty != null) {
      map['product_property'] = _productProperty?.map((v) => v.toJson()).toList();
    }
    map['property_ids'] = _propertyIds;
    map['rate_id'] = _rateId;
    map['relation_type'] = _relationType;
    map['string'] = _string;
    map['tags'] = _tags;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    map['type'] = _type;
    return map;
  }

}

class Categories {
  Categories({
      Description? description, 
      String? id, 
      String? image, 
      bool? isActive, 
      String? orderNo, 
      String? parentId, 
      String? slug, 
      Title? title,}){
    _description = description;
    _id = id;
    _image = image;
    _isActive = isActive;
    _orderNo = orderNo;
    _parentId = parentId;
    _slug = slug;
    _title = title;
}

  Categories.fromJson(dynamic json) {
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    _id = json['id'];
    _image = json['image'];
    _isActive = json['is_active'];
    _orderNo = json['order_no'];
    _parentId = json['parent_id'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }
  Description? _description;
  String? _id;
  String? _image;
  bool? _isActive;
  String? _orderNo;
  String? _parentId;
  String? _slug;
  Title? _title;
Categories copyWith({  Description? description,
  String? id,
  String? image,
  bool? isActive,
  String? orderNo,
  String? parentId,
  String? slug,
  Title? title,
}) => Categories(  description: description ?? _description,
  id: id ?? _id,
  image: image ?? _image,
  isActive: isActive ?? _isActive,
  orderNo: orderNo ?? _orderNo,
  parentId: parentId ?? _parentId,
  slug: slug ?? _slug,
  title: title ?? _title,
);
  Description? get description => _description;
  String? get id => _id;
  String? get image => _image;
  bool? get isActive => _isActive;
  String? get orderNo => _orderNo;
  String? get parentId => _parentId;
  String? get slug => _slug;
  Title? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['id'] = _id;
    map['image'] = _image;
    map['is_active'] = _isActive;
    map['order_no'] = _orderNo;
    map['parent_id'] = _parentId;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    return map;
  }

}

class Brand {
  Brand({
      Description? description, 
      String? id, 
      String? image, 
      bool? isActive, 
      String? orderNo, 
      String? parentId, 
      String? slug, 
      Title? title,}){
    _description = description;
    _id = id;
    _image = image;
    _isActive = isActive;
    _orderNo = orderNo;
    _parentId = parentId;
    _slug = slug;
    _title = title;
}

  Brand.fromJson(dynamic json) {
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    _id = json['id'];
    _image = json['image'];
    _isActive = json['is_active'];
    _orderNo = json['order_no'];
    _parentId = json['parent_id'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }
  Description? _description;
  String? _id;
  String? _image;
  bool? _isActive;
  String? _orderNo;
  String? _parentId;
  String? _slug;
  Title? _title;
Brand copyWith({  Description? description,
  String? id,
  String? image,
  bool? isActive,
  String? orderNo,
  String? parentId,
  String? slug,
  Title? title,
}) => Brand(  description: description ?? _description,
  id: id ?? _id,
  image: image ?? _image,
  isActive: isActive ?? _isActive,
  orderNo: orderNo ?? _orderNo,
  parentId: parentId ?? _parentId,
  slug: slug ?? _slug,
  title: title ?? _title,
);
  Description? get description => _description;
  String? get id => _id;
  String? get image => _image;
  bool? get isActive => _isActive;
  String? get orderNo => _orderNo;
  String? get parentId => _parentId;
  String? get slug => _slug;
  Title? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['id'] = _id;
    map['image'] = _image;
    map['is_active'] = _isActive;
    map['order_no'] = _orderNo;
    map['parent_id'] = _parentId;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    return map;
  }

}