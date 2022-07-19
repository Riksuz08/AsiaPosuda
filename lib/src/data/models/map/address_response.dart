class AddressResponse {
  Response? response;

  AddressResponse({this.response});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response?.toJson();
    }
    return data;
  }
}

class Response {
  GeoObjectCollection? geoObjectCollection;

  Response({this.geoObjectCollection});

  Response.fromJson(Map<String, dynamic> json) {
    geoObjectCollection = json['GeoObjectCollection'] != null
        ? new GeoObjectCollection.fromJson(json['GeoObjectCollection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geoObjectCollection != null) {
      data['GeoObjectCollection'] = this.geoObjectCollection?.toJson();
    }
    return data;
  }
}

class GeoObjectCollection {
  MetaDataProperty? metaDataProperty;
  List<FeatureMember>? featureMember;

  GeoObjectCollection({this.metaDataProperty, this.featureMember});

  GeoObjectCollection.fromJson(Map<String, dynamic> json) {
    metaDataProperty = json['metaDataProperty'] != null
        ? new MetaDataProperty.fromJson(json['metaDataProperty'])
        : null;
    featureMember = [];
    if (json['featureMember'] != null) {
      json['featureMember'].forEach((v) {
        featureMember?.add(new FeatureMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metaDataProperty != null) {
      data['metaDataProperty'] = this.metaDataProperty?.toJson();
    }
    if (this.featureMember != null) {
      data['featureMember'] =
          this.featureMember?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MetaDataProperty {
  GeocoderResponseMetaData? geocoderResponseMetaData;

  MetaDataProperty({this.geocoderResponseMetaData});

  MetaDataProperty.fromJson(Map<String, dynamic> json) {
    geocoderResponseMetaData = json['GeocoderResponseMetaData'] != null
        ? new GeocoderResponseMetaData.fromJson(
        json['GeocoderResponseMetaData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geocoderResponseMetaData != null) {
      data['GeocoderResponseMetaData'] = this.geocoderResponseMetaData?.toJson();
    }
    return data;
  }
}

class GeocoderResponseMetaData {
  Pointy? point;
  String? request;
  String? results;
  String? found;

  GeocoderResponseMetaData(
      {this.point, this.request, this.results, this.found});

  GeocoderResponseMetaData.fromJson(Map<String, dynamic> json) {
    point = json['Point'] != null ? new Pointy.fromJson(json['Point']) : null;
    request = json['request'];
    results = json['results'];
    found = json['found'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.point != null) {
      data['Point'] = this.point?.toJson();
    }
    data['request'] = this.request;
    data['results'] = this.results;
    data['found'] = this.found;
    return data;
  }
}

class Pointy {
  String? pos;

  Pointy({this.pos});

  Pointy.fromJson(Map<String, dynamic> json) {
    pos = json['pos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pos'] = this.pos;
    return data;
  }
}

class FeatureMember {
  GeoObject? geoObject;

  FeatureMember({this.geoObject});

  FeatureMember.fromJson(Map<String, dynamic> json) {
    geoObject = json['GeoObject'] != null
        ? new GeoObject.fromJson(json['GeoObject'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geoObject != null) {
      data['GeoObject'] = this.geoObject?.toJson();
    }
    return data;
  }
}

class GeoObject {
  MetaDataProperties? metaDataProperty;
  String? name;
  String? description;
  BoundedBy? boundedBy;
  Pointy? point;

  GeoObject(
      {this.metaDataProperty,
        this.name,
        this.description,
        this.boundedBy,
        this.point});

  GeoObject.fromJson(Map<String, dynamic> json) {
    metaDataProperty = json['metaDataProperty'] != null
        ? new MetaDataProperties.fromJson(json['metaDataProperty'])
        : null;
    name = json['name'];
    description = json['description'];
    boundedBy = json['boundedBy'] != null
        ? new BoundedBy.fromJson(json['boundedBy'])
        : null;
    point = json['Point'] != null ? new Pointy.fromJson(json['Point']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metaDataProperty != null) {
      data['metaDataProperty'] = this.metaDataProperty?.toJson();
    }
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.boundedBy != null) {
      data['boundedBy'] = this.boundedBy?.toJson();
    }
    if (this.point != null) {
      data['Point'] = this.point?.toJson();
    }
    return data;
  }
}

class MetaDataProperties {
  GeocoderMetaData? geocoderMetaData;

  MetaDataProperties({this.geocoderMetaData});

  MetaDataProperties.fromJson(Map<String, dynamic> json) {
    geocoderMetaData = json['GeocoderMetaData'] != null
        ? GeocoderMetaData.fromJson(json['GeocoderMetaData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geocoderMetaData != null) {
      data['GeocoderMetaData'] = this.geocoderMetaData?.toJson();
    }
    return data;
  }
}

class GeocoderMetaData {
  String? precision;
  String? text;
  String? kind;
  Address? address;
  AddressDetails? addressDetails;

  GeocoderMetaData(
      {this.precision,
        this.text,
        this.kind,
        this.address,
        this.addressDetails});

  GeocoderMetaData.fromJson(Map<String, dynamic> json) {
    precision = json['precision'];
    text = json['text'];
    kind = json['kind'];
    address =
    json['Address'] != null ? new Address.fromJson(json['Address']) : null;
    addressDetails = json['AddressDetails'] != null
        ? new AddressDetails.fromJson(json['AddressDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['precision'] = this.precision;
    data['text'] = this.text;
    data['kind'] = this.kind;
    if (this.address != null) {
      data['Address'] = this.address?.toJson();
    }
    if (this.addressDetails != null) {
      data['AddressDetails'] = this.addressDetails?.toJson();
    }
    return data;
  }
}

class Address {
  String? countryCode;
  String? formatted;
  List<Components>? components;

  Address({this.countryCode, this.formatted, this.components});

  Address.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    formatted = json['formatted'];
    components = [];
    if (json['Components'] != null) {
      json['Components'].forEach((v) {
        components?.add(new Components.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['formatted'] = this.formatted;
    if (this.components != null) {
      data['Components'] = this.components?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Components {
  String? kind;
  String? name;

  Components({this.kind, this.name});

  Components.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['name'] = this.name;
    return data;
  }
}

class AddressDetails {
  Country? country;

  AddressDetails({this.country});

  AddressDetails.fromJson(Map<String, dynamic> json) {
    country =
    json['Country'] != null ? new Country.fromJson(json['Country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['Country'] = this.country?.toJson();
    }
    return data;
  }
}

class Country {
  String? addressLine;
  String? countryNameCode;
  String? countryName;
  AdministrativeArea? administrativeArea;

  Country(
      {this.addressLine,
        this.countryNameCode,
        this.countryName,
        this.administrativeArea});

  Country.fromJson(Map<String, dynamic> json) {
    addressLine = json['AddressLine'];
    countryNameCode = json['CountryNameCode'];
    countryName = json['CountryName'];
    administrativeArea = json['AdministrativeArea'] != null
        ? new AdministrativeArea.fromJson(json['AdministrativeArea'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AddressLine'] = this.addressLine;
    data['CountryNameCode'] = this.countryNameCode;
    data['CountryName'] = this.countryName;
    if (this.administrativeArea != null) {
      data['AdministrativeArea'] = this.administrativeArea?.toJson();
    }
    return data;
  }
}

class AdministrativeArea {
  String? administrativeAreaName;
  Locality? locality;

  AdministrativeArea({this.administrativeAreaName, this.locality});

  AdministrativeArea.fromJson(Map<String, dynamic> json) {
    administrativeAreaName = json['AdministrativeAreaName'];
    locality = json['Locality'] != null
        ? new Locality.fromJson(json['Locality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AdministrativeAreaName'] = this.administrativeAreaName;
    if (this.locality != null) {
      data['Locality'] = this.locality?.toJson();
    }
    return data;
  }
}

class Locality {
  String? localityName;
  DependentLocality? dependentLocality;

  Locality({this.localityName, this.dependentLocality});

  Locality.fromJson(Map<String, dynamic> json) {
    localityName = json['LocalityName'];
    dependentLocality = json['DependentLocality'] != null
        ? new DependentLocality.fromJson(json['DependentLocality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LocalityName'] = this.localityName;
    if (this.dependentLocality != null) {
      data['DependentLocality'] = this.dependentLocality?.toJson();
    }
    return data;
  }
}

class DependentLocality {
  String? dependentLocalityName;
  DependentLocality? dependentLocality;
  Premise? premise;

  DependentLocality(
      {this.dependentLocalityName, this.dependentLocality, this.premise});

  DependentLocality.fromJson(Map<String, dynamic> json) {
    dependentLocalityName = json['DependentLocalityName'];
    dependentLocality = json['DependentLocality'] != null
        ? new DependentLocality.fromJson(json['DependentLocality'])
        : null;
    premise =
    json['Premise'] != null ? new Premise.fromJson(json['Premise']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DependentLocalityName'] = this.dependentLocalityName;
    if (this.dependentLocality != null) {
      data['DependentLocality'] = this.dependentLocality?.toJson();
    }
    if (this.premise != null) {
      data['Premise'] = this.premise?.toJson();
    }
    return data;
  }
}

class DependentLocalities {
  String? dependentLocalityName;
  Premise? premise;

  DependentLocalities({this.dependentLocalityName, this.premise});

  DependentLocalities.fromJson(Map<String, dynamic> json) {
    dependentLocalityName = json['DependentLocalityName'];
    premise =
    json['Premise'] != null ? new Premise.fromJson(json['Premise']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DependentLocalityName'] = this.dependentLocalityName;
    if (this.premise != null) {
      data['Premise'] = this.premise?.toJson();
    }
    return data;
  }
}

class Premise {
  String? premiseNumber;

  Premise({this.premiseNumber});

  Premise.fromJson(Map<String, dynamic> json) {
    premiseNumber = json['PremiseNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PremiseNumber'] = this.premiseNumber;
    return data;
  }
}

class BoundedBy {
  Envelope? envelope;

  BoundedBy({this.envelope});

  BoundedBy.fromJson(Map<String, dynamic> json) {
    envelope = json['Envelope'] != null
        ? new Envelope.fromJson(json['Envelope'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.envelope != null) {
      data['Envelope'] = this.envelope?.toJson();
    }
    return data;
  }
}

class Envelope {
  String? lowerCorner;
  String? upperCorner;

  Envelope({this.lowerCorner, this.upperCorner});

  Envelope.fromJson(Map<String, dynamic> json) {
    lowerCorner = json['lowerCorner'];
    upperCorner = json['upperCorner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lowerCorner'] = this.lowerCorner;
    data['upperCorner'] = this.upperCorner;
    return data;
  }
}
