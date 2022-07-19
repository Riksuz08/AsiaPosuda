class ProductByIdResponse {
  ProductByIdResponse({
    String? id,
    String? slug,
    Title? title,
    String? code,
    Description? description,
    List<Categories>? categories,
    Brand? brand,
    bool? isDivisible,
    String? count,
    List<Tags>? tags,
    Measurement? measurement,
    dynamic rate,
    num? inPrice,
    num? outPrice,
    String? image,
    List<dynamic>? gallery,
    bool? active,
    String? order,
    String? createdAt,
    String? iikoId,
    String? jowiId,
    String? shipperId,
    List<dynamic>? priceChangers,
    String? currency,
    String? type,
    List<Properties>? properties,
    List<dynamic>? productProperty,
    List<VariantProducts>? variantProducts,}){
    _id = id;
    _slug = slug;
    _title = title;
    _code = code;
    _description = description;
    _categories = categories;
    _brand = brand;
    _isDivisible = isDivisible;
    _count = count;
    _tags = tags;
    _measurement = measurement;
    _rate = rate;
    _inPrice = inPrice;
    _outPrice = outPrice;
    _image = image;
    _gallery = gallery;
    _active = active;
    _order = order;
    _createdAt = createdAt;
    _iikoId = iikoId;
    _jowiId = jowiId;
    _shipperId = shipperId;
    _priceChangers = priceChangers;
    _currency = currency;
    _type = type;
    _properties = properties;
    _productProperty = productProperty;
    _variantProducts = variantProducts;
  }

  ProductByIdResponse.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _code = json['code'];
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _isDivisible = json['is_divisible'];
    _count = json['count'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    _measurement = json['measurement'] != null ? Measurement.fromJson(json['measurement']) : null;
    _rate = json['rate'];
    _inPrice = json['in_price'];
    _outPrice = json['out_price'];
    _image = json['image'];
    if (json['gallery'] != null) {
      _gallery = [];
      json['gallery'].forEach((v) {
        _gallery?.add(v.fromJson(v));
      });
    }
    _active = json['active'];
    _order = json['order'];
    _createdAt = json['created_at'];
    _iikoId = json['iiko_id'];
    _jowiId = json['jowi_id'];
    _shipperId = json['shipper_id'];
    if (json['price_changers'] != null) {
      _priceChangers = [];
      json['price_changers'].forEach((v) {
        _priceChangers?.add(v.fromJson(v));
      });
    }
    _currency = json['currency'];
    _type = json['type'];
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    if (json['product_property'] != null) {
      _productProperty = [];
      json['product_property'].forEach((v) {
        _productProperty?.add(v.fromJson(v));
      });
    }
    if (json['variant_products'] != null) {
      _variantProducts = [];
      json['variant_products'].forEach((v) {
        _variantProducts?.add(VariantProducts.fromJson(v));
      });
    }
  }
  String? _id;
  String? _slug;
  Title? _title;
  String? _code;
  Description? _description;
  List<Categories>? _categories;
  Brand? _brand;
  bool? _isDivisible;
  String? _count;
  List<Tags>? _tags;
  Measurement? _measurement;
  dynamic _rate;
  num? _inPrice;
  num? _outPrice;
  String? _image;
  List<dynamic>? _gallery;
  bool? _active;
  String? _order;
  String? _createdAt;
  String? _iikoId;
  String? _jowiId;
  String? _shipperId;
  List<dynamic>? _priceChangers;
  String? _currency;
  String? _type;
  List<Properties>? _properties;
  List<dynamic>? _productProperty;
  List<VariantProducts>? _variantProducts;
  ProductByIdResponse copyWith({  String? id,
    String? slug,
    Title? title,
    String? code,
    Description? description,
    List<Categories>? categories,
    Brand? brand,
    bool? isDivisible,
    String? count,
    List<Tags>? tags,
    Measurement? measurement,
    dynamic rate,
    num? inPrice,
    num? outPrice,
    String? image,
    List<dynamic>? gallery,
    bool? active,
    String? order,
    String? createdAt,
    String? iikoId,
    String? jowiId,
    String? shipperId,
    List<dynamic>? priceChangers,
    String? currency,
    String? type,
    List<Properties>? properties,
    List<dynamic>? productProperty,
    List<VariantProducts>? variantProducts,
  }) => ProductByIdResponse(  id: id ?? _id,
    slug: slug ?? _slug,
    title: title ?? _title,
    code: code ?? _code,
    description: description ?? _description,
    categories: categories ?? _categories,
    brand: brand ?? _brand,
    isDivisible: isDivisible ?? _isDivisible,
    count: count ?? _count,
    tags: tags ?? _tags,
    measurement: measurement ?? _measurement,
    rate: rate ?? _rate,
    inPrice: inPrice ?? _inPrice,
    outPrice: outPrice ?? _outPrice,
    image: image ?? _image,
    gallery: gallery ?? _gallery,
    active: active ?? _active,
    order: order ?? _order,
    createdAt: createdAt ?? _createdAt,
    iikoId: iikoId ?? _iikoId,
    jowiId: jowiId ?? _jowiId,
    shipperId: shipperId ?? _shipperId,
    priceChangers: priceChangers ?? _priceChangers,
    currency: currency ?? _currency,
    type: type ?? _type,
    properties: properties ?? _properties,
    productProperty: productProperty ?? _productProperty,
    variantProducts: variantProducts ?? _variantProducts,
  );
  String? get id => _id;
  String? get slug => _slug;
  Title? get title => _title;
  String? get code => _code;
  Description? get description => _description;
  List<Categories>? get categories => _categories;
  Brand? get brand => _brand;
  bool? get isDivisible => _isDivisible;
  String? get count => _count;
  List<Tags>? get tags => _tags;
  Measurement? get measurement => _measurement;
  dynamic get rate => _rate;
  num? get inPrice => _inPrice;
  num? get outPrice => _outPrice;
  String? get image => _image;
  List<dynamic>? get gallery => _gallery;
  bool? get active => _active;
  String? get order => _order;
  String? get createdAt => _createdAt;
  String? get iikoId => _iikoId;
  String? get jowiId => _jowiId;
  String? get shipperId => _shipperId;
  List<dynamic>? get priceChangers => _priceChangers;
  String? get currency => _currency;
  String? get type => _type;
  List<Properties>? get properties => _properties;
  List<dynamic>? get productProperty => _productProperty;
  List<VariantProducts>? get variantProducts => _variantProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    map['code'] = _code;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    map['is_divisible'] = _isDivisible;
    map['count'] = _count;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    if (_measurement != null) {
      map['measurement'] = _measurement?.toJson();
    }
    map['rate'] = _rate;
    map['in_price'] = _inPrice;
    map['out_price'] = _outPrice;
    map['image'] = _image;
    if (_gallery != null) {
      map['gallery'] = _gallery?.map((v) => v.toJson()).toList();
    }
    map['active'] = _active;
    map['order'] = _order;
    map['created_at'] = _createdAt;
    map['iiko_id'] = _iikoId;
    map['jowi_id'] = _jowiId;
    map['shipper_id'] = _shipperId;
    if (_priceChangers != null) {
      map['price_changers'] = _priceChangers?.map((v) => v.toJson()).toList();
    }
    map['currency'] = _currency;
    map['type'] = _type;
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    if (_productProperty != null) {
      map['product_property'] = _productProperty?.map((v) => v.toJson()).toList();
    }
    if (_variantProducts != null) {
      map['variant_products'] = _variantProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class VariantProducts {
  VariantProducts({
    String? id,
    String? slug,
    Title? title,
    String? code,
    Description? description,
    List<String>? categories,
    String? brand,
    bool? isDivisible,
    String? count,
    List<String>? tags,
    String? measurementId,
    String? rateId,
    num? inPrice,
    num? outPrice,
    String? image,
    List<dynamic>? gallery,
    bool? active,
    String? order,
    String? type,
    String? createdAt,
    List<ProductProperty>? productProperty,
    String? iikoId,
    String? jowiId,
    String? shipperId,
    List<dynamic>? priceChangers,
    String? currency,
    List<String>? propertyIds,
    String? parentId,
    String? relationType,}){
    _id = id;
    _slug = slug;
    _title = title;
    _code = code;
    _description = description;
    _categories = categories;
    _brand = brand;
    _isDivisible = isDivisible;
    _count = count;
    _tags = tags;
    _measurementId = measurementId;
    _rateId = rateId;
    _inPrice = inPrice;
    _outPrice = outPrice;
    _image = image;
    _gallery = gallery;
    _active = active;
    _order = order;
    _type = type;
    _createdAt = createdAt;
    _productProperty = productProperty;
    _iikoId = iikoId;
    _jowiId = jowiId;
    _shipperId = shipperId;
    _priceChangers = priceChangers;
    _currency = currency;
    _propertyIds = propertyIds;
    _parentId = parentId;
    _relationType = relationType;
  }

  VariantProducts.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _code = json['code'];
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    _categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    _brand = json['brand'];
    _isDivisible = json['is_divisible'];
    _count = json['count'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _measurementId = json['measurement_id'];
    _rateId = json['rate_id'];
    _inPrice = json['in_price'];
    _outPrice = json['out_price'];
    _image = json['image'];
    if (json['gallery'] != null) {
      _gallery = [];
      json['gallery'].forEach((v) {
        _gallery?.add(v.fromJson(v));
      });
    }
    _active = json['active'];
    _order = json['order'];
    _type = json['type'];
    _createdAt = json['created_at'];
    if (json['product_property'] != null) {
      _productProperty = [];
      json['product_property'].forEach((v) {
        _productProperty?.add(ProductProperty.fromJson(v));
      });
    }
    _iikoId = json['iiko_id'];
    _jowiId = json['jowi_id'];
    _shipperId = json['shipper_id'];
    if (json['price_changers'] != null) {
      _priceChangers = [];
      json['price_changers'].forEach((v) {
        _priceChangers?.add(v.fromJson(v));
      });
    }
    _currency = json['currency'];
    _propertyIds = json['property_ids'] != null ? json['property_ids'].cast<String>() : [];
    _parentId = json['parent_id'];
    _relationType = json['relation_type'];
  }
  String? _id;
  String? _slug;
  Title? _title;
  String? _code;
  Description? _description;
  List<String>? _categories;
  String? _brand;
  bool? _isDivisible;
  String? _count;
  List<String>? _tags;
  String? _measurementId;
  String? _rateId;
  num? _inPrice;
  num? _outPrice;
  String? _image;
  List<dynamic>? _gallery;
  bool? _active;
  String? _order;
  String? _type;
  String? _createdAt;
  List<ProductProperty>? _productProperty;
  String? _iikoId;
  String? _jowiId;
  String? _shipperId;
  List<dynamic>? _priceChangers;
  String? _currency;
  List<String>? _propertyIds;
  String? _parentId;
  String? _relationType;
  VariantProducts copyWith({  String? id,
    String? slug,
    Title? title,
    String? code,
    Description? description,
    List<String>? categories,
    String? brand,
    bool? isDivisible,
    String? count,
    List<String>? tags,
    String? measurementId,
    String? rateId,
    num? inPrice,
    num? outPrice,
    String? image,
    List<dynamic>? gallery,
    bool? active,
    String? order,
    String? type,
    String? createdAt,
    List<ProductProperty>? productProperty,
    String? iikoId,
    String? jowiId,
    String? shipperId,
    List<dynamic>? priceChangers,
    String? currency,
    List<String>? propertyIds,
    String? parentId,
    String? relationType,
  }) => VariantProducts(  id: id ?? _id,
    slug: slug ?? _slug,
    title: title ?? _title,
    code: code ?? _code,
    description: description ?? _description,
    categories: categories ?? _categories,
    brand: brand ?? _brand,
    isDivisible: isDivisible ?? _isDivisible,
    count: count ?? _count,
    tags: tags ?? _tags,
    measurementId: measurementId ?? _measurementId,
    rateId: rateId ?? _rateId,
    inPrice: inPrice ?? _inPrice,
    outPrice: outPrice ?? _outPrice,
    image: image ?? _image,
    gallery: gallery ?? _gallery,
    active: active ?? _active,
    order: order ?? _order,
    type: type ?? _type,
    createdAt: createdAt ?? _createdAt,
    productProperty: productProperty ?? _productProperty,
    iikoId: iikoId ?? _iikoId,
    jowiId: jowiId ?? _jowiId,
    shipperId: shipperId ?? _shipperId,
    priceChangers: priceChangers ?? _priceChangers,
    currency: currency ?? _currency,
    propertyIds: propertyIds ?? _propertyIds,
    parentId: parentId ?? _parentId,
    relationType: relationType ?? _relationType,
  );
  String? get id => _id;
  String? get slug => _slug;
  Title? get title => _title;
  String? get code => _code;
  Description? get description => _description;
  List<String>? get categories => _categories;
  String? get brand => _brand;
  bool? get isDivisible => _isDivisible;
  String? get count => _count;
  List<String>? get tags => _tags;
  String? get measurementId => _measurementId;
  String? get rateId => _rateId;
  num? get inPrice => _inPrice;
  num? get outPrice => _outPrice;
  String? get image => _image;
  List<dynamic>? get gallery => _gallery;
  bool? get active => _active;
  String? get order => _order;
  String? get type => _type;
  String? get createdAt => _createdAt;
  List<ProductProperty>? get productProperty => _productProperty;
  String? get iikoId => _iikoId;
  String? get jowiId => _jowiId;
  String? get shipperId => _shipperId;
  List<dynamic>? get priceChangers => _priceChangers;
  String? get currency => _currency;
  List<String>? get propertyIds => _propertyIds;
  String? get parentId => _parentId;
  String? get relationType => _relationType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    map['code'] = _code;
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['categories'] = _categories;
    map['brand'] = _brand;
    map['is_divisible'] = _isDivisible;
    map['count'] = _count;
    map['tags'] = _tags;
    map['measurement_id'] = _measurementId;
    map['rate_id'] = _rateId;
    map['in_price'] = _inPrice;
    map['out_price'] = _outPrice;
    map['image'] = _image;
    if (_gallery != null) {
      map['gallery'] = _gallery?.map((v) => v.toJson()).toList();
    }
    map['active'] = _active;
    map['order'] = _order;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    if (_productProperty != null) {
      map['product_property'] = _productProperty?.map((v) => v.toJson()).toList();
    }
    map['iiko_id'] = _iikoId;
    map['jowi_id'] = _jowiId;
    map['shipper_id'] = _shipperId;
    if (_priceChangers != null) {
      map['price_changers'] = _priceChangers?.map((v) => v.toJson()).toList();
    }
    map['currency'] = _currency;
    map['property_ids'] = _propertyIds;
    map['parent_id'] = _parentId;
    map['relation_type'] = _relationType;
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
    String? uz,
    String? ru,
    String? en,}){
    _uz = uz;
    _ru = ru;
    _en = en;
  }

  Description.fromJson(dynamic json) {
    _uz = json['uz'];
    _ru = json['ru'];
    _en = json['en'];
  }
  String? _uz;
  String? _ru;
  String? _en;
  Description copyWith({  String? uz,
    String? ru,
    String? en,
  }) => Description(  uz: uz ?? _uz,
    ru: ru ?? _ru,
    en: en ?? _en,
  );
  String? get uz => _uz;
  String? get ru => _ru;
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uz'] = _uz;
    map['ru'] = _ru;
    map['en'] = _en;
    return map;
  }

}

class Title {
  Title({
    String? uz,
    String? ru,
    String? en,}){
    _uz = uz;
    _ru = ru;
    _en = en;
  }

  Title.fromJson(dynamic json) {
    _uz = json['uz'];
    _ru = json['ru'];
    _en = json['en'];
  }
  String? _uz;
  String? _ru;
  String? _en;
  Title copyWith({  String? uz,
    String? ru,
    String? en,
  }) => Title(  uz: uz ?? _uz,
    ru: ru ?? _ru,
    en: en ?? _en,
  );
  String? get uz => _uz;
  String? get ru => _ru;
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uz'] = _uz;
    map['ru'] = _ru;
    map['en'] = _en;
    return map;
  }

}

class Properties {
  Properties({
    String? id,
    String? slug,
    Title? title,
    Description? description,
    String? createdAt,
    String? shipperId,
    bool? active,
    String? orderNo,
    num? selectIndex,
    List<String>? options,}){
    _id = id;
    _slug = slug;
    _title = title;
    _description = description;
    _createdAt = createdAt;
    _shipperId = shipperId;
    _active = active;
    _orderNo = orderNo;
    _options = options;
    _selectIndex = selectIndex;
  }

  Properties.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    _createdAt = json['created_at'];
    _shipperId = json['shipper_id'];
    _active = json['active'];
    _orderNo = json['order_no'];
    _selectIndex = 0;
    _options = json['options'] != null ? json['options'].cast<String>() : [];
  }
  String? _id;
  String? _slug;
  Title? _title;
  Description? _description;
  String? _createdAt;
  String? _shipperId;
  bool? _active;
  String? _orderNo;
  num? _selectIndex;
  List<String>? _options;
  Properties copyWith({  String? id,
    String? slug,
    Title? title,
    Description? description,
    String? createdAt,
    String? shipperId,
    bool? active,
    String? orderNo,
    num? selectIndex,
    List<String>? options,
  }) => Properties(  id: id ?? _id,
    slug: slug ?? _slug,
    title: title ?? _title,
    description: description ?? _description,
    createdAt: createdAt ?? _createdAt,
    shipperId: shipperId ?? _shipperId,
    active: active ?? _active,
    orderNo: orderNo ?? _orderNo,
    selectIndex: selectIndex ?? _selectIndex,
    options: options ?? _options,
  );
  String? get id => _id;
  String? get slug => _slug;
  Title? get title => _title;
  Description? get description => _description;
  String? get createdAt => _createdAt;
  String? get shipperId => _shipperId;
  bool? get active => _active;
  String? get orderNo => _orderNo;
  num? get selectIndex => _selectIndex;

  set selectIndex(num? value) {
    _selectIndex = value;
  }

  List<String>? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['created_at'] = _createdAt;
    map['shipper_id'] = _shipperId;
    map['active'] = _active;
    map['order_no'] = _orderNo;
    map['options'] = _options;
    return map;
  }

}

class Measurement {
  Measurement({
    String? id,
    String? shipperId,
    String? slug,
    Title? title,
    String? shortName,
    String? createdAt,
    num? accuracy,}){
    _id = id;
    _shipperId = shipperId;
    _slug = slug;
    _title = title;
    _shortName = shortName;
    _createdAt = createdAt;
    _accuracy = accuracy;
  }

  Measurement.fromJson(dynamic json) {
    _id = json['id'];
    _shipperId = json['shipper_id'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _shortName = json['short_name'];
    _createdAt = json['created_at'];
    _accuracy = json['accuracy'];
  }
  String? _id;
  String? _shipperId;
  String? _slug;
  Title? _title;
  String? _shortName;
  String? _createdAt;
  num? _accuracy;
  Measurement copyWith({  String? id,
    String? shipperId,
    String? slug,
    Title? title,
    String? shortName,
    String? createdAt,
    num? accuracy,
  }) => Measurement(  id: id ?? _id,
    shipperId: shipperId ?? _shipperId,
    slug: slug ?? _slug,
    title: title ?? _title,
    shortName: shortName ?? _shortName,
    createdAt: createdAt ?? _createdAt,
    accuracy: accuracy ?? _accuracy,
  );
  String? get id => _id;
  String? get shipperId => _shipperId;
  String? get slug => _slug;
  Title? get title => _title;
  String? get shortName => _shortName;
  String? get createdAt => _createdAt;
  num? get accuracy => _accuracy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shipper_id'] = _shipperId;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    map['short_name'] = _shortName;
    map['created_at'] = _createdAt;
    map['accuracy'] = _accuracy;
    return map;
  }

}

class Tags {
  Tags({
    String? id,
    Title? title,
    String? icon,
    String? slug,
    String? shipperId,
    String? createdAt,
    String? color,}){
    _id = id;
    _title = title;
    _icon = icon;
    _slug = slug;
    _shipperId = shipperId;
    _createdAt = createdAt;
    _color = color;
  }

  Tags.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _icon = json['icon'];
    _slug = json['slug'];
    _shipperId = json['shipper_id'];
    _createdAt = json['created_at'];
    _color = json['color'];
  }
  String? _id;
  Title? _title;
  String? _icon;
  String? _slug;
  String? _shipperId;
  String? _createdAt;
  String? _color;
  Tags copyWith({  String? id,
    Title? title,
    String? icon,
    String? slug,
    String? shipperId,
    String? createdAt,
    String? color,
  }) => Tags(  id: id ?? _id,
    title: title ?? _title,
    icon: icon ?? _icon,
    slug: slug ?? _slug,
    shipperId: shipperId ?? _shipperId,
    createdAt: createdAt ?? _createdAt,
    color: color ?? _color,
  );
  String? get id => _id;
  Title? get title => _title;
  String? get icon => _icon;
  String? get slug => _slug;
  String? get shipperId => _shipperId;
  String? get createdAt => _createdAt;
  String? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    map['icon'] = _icon;
    map['slug'] = _slug;
    map['shipper_id'] = _shipperId;
    map['created_at'] = _createdAt;
    map['color'] = _color;
    return map;
  }

}

class Brand {
  Brand({
    String? id,
    String? slug,
    String? image,
    Title? title,
    bool? active,
    String? orderNo,
    String? createdAt,
    String? shipperId,}){
    _id = id;
    _slug = slug;
    _image = image;
    _title = title;
    _active = active;
    _orderNo = orderNo;
    _createdAt = createdAt;
    _shipperId = shipperId;
  }

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _image = json['image'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _active = json['active'];
    _orderNo = json['order_no'];
    _createdAt = json['created_at'];
    _shipperId = json['shipper_id'];
  }
  String? _id;
  String? _slug;
  String? _image;
  Title? _title;
  bool? _active;
  String? _orderNo;
  String? _createdAt;
  String? _shipperId;
  Brand copyWith({  String? id,
    String? slug,
    String? image,
    Title? title,
    bool? active,
    String? orderNo,
    String? createdAt,
    String? shipperId,
  }) => Brand(  id: id ?? _id,
    slug: slug ?? _slug,
    image: image ?? _image,
    title: title ?? _title,
    active: active ?? _active,
    orderNo: orderNo ?? _orderNo,
    createdAt: createdAt ?? _createdAt,
    shipperId: shipperId ?? _shipperId,
  );
  String? get id => _id;
  String? get slug => _slug;
  String? get image => _image;
  Title? get title => _title;
  bool? get active => _active;
  String? get orderNo => _orderNo;
  String? get createdAt => _createdAt;
  String? get shipperId => _shipperId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    map['image'] = _image;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    map['active'] = _active;
    map['order_no'] = _orderNo;
    map['created_at'] = _createdAt;
    map['shipper_id'] = _shipperId;
    return map;
  }

}

class Categories {
  Categories({
    String? id,
    String? slug,
    Title? title,
    Description? description,
    String? parentId,
    String? image,
    List<dynamic>? propertyIds,
    bool? active,
    String? orderNo,
    String? createdAt,
    String? shipperId,
    String? iikoId,
    String? jowiId,}){
    _id = id;
    _slug = slug;
    _title = title;
    _description = description;
    _parentId = parentId;
    _image = image;
    _propertyIds = propertyIds;
    _active = active;
    _orderNo = orderNo;
    _createdAt = createdAt;
    _shipperId = shipperId;
    _iikoId = iikoId;
    _jowiId = jowiId;
  }

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    _parentId = json['parent_id'];
    _image = json['image'];
    if (json['property_ids'] != null) {
      _propertyIds = [];
      json['property_ids'].forEach((v) {
        _propertyIds?.add(v.fromJson(v));
      });
    }
    _active = json['active'];
    _orderNo = json['order_no'];
    _createdAt = json['created_at'];
    _shipperId = json['shipper_id'];
    _iikoId = json['iiko_id'];
    _jowiId = json['jowi_id'];
  }
  String? _id;
  String? _slug;
  Title? _title;
  Description? _description;
  String? _parentId;
  String? _image;
  List<dynamic>? _propertyIds;
  bool? _active;
  String? _orderNo;
  String? _createdAt;
  String? _shipperId;
  String? _iikoId;
  String? _jowiId;
  Categories copyWith({  String? id,
    String? slug,
    Title? title,
    Description? description,
    String? parentId,
    String? image,
    List<dynamic>? propertyIds,
    bool? active,
    String? orderNo,
    String? createdAt,
    String? shipperId,
    String? iikoId,
    String? jowiId,
  }) => Categories(  id: id ?? _id,
    slug: slug ?? _slug,
    title: title ?? _title,
    description: description ?? _description,
    parentId: parentId ?? _parentId,
    image: image ?? _image,
    propertyIds: propertyIds ?? _propertyIds,
    active: active ?? _active,
    orderNo: orderNo ?? _orderNo,
    createdAt: createdAt ?? _createdAt,
    shipperId: shipperId ?? _shipperId,
    iikoId: iikoId ?? _iikoId,
    jowiId: jowiId ?? _jowiId,
  );
  String? get id => _id;
  String? get slug => _slug;
  Title? get title => _title;
  Description? get description => _description;
  String? get parentId => _parentId;
  String? get image => _image;
  List<dynamic>? get propertyIds => _propertyIds;
  bool? get active => _active;
  String? get orderNo => _orderNo;
  String? get createdAt => _createdAt;
  String? get shipperId => _shipperId;
  String? get iikoId => _iikoId;
  String? get jowiId => _jowiId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['parent_id'] = _parentId;
    map['image'] = _image;
    if (_propertyIds != null) {
      map['property_ids'] = _propertyIds?.map((v) => v.toJson()).toList();
    }
    map['active'] = _active;
    map['order_no'] = _orderNo;
    map['created_at'] = _createdAt;
    map['shipper_id'] = _shipperId;
    map['iiko_id'] = _iikoId;
    map['jowi_id'] = _jowiId;
    return map;
  }

}