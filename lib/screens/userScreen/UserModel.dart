class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  Address? address;
  Company? company;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.website,
      this.address,
      this.company});

  UserModel userfromJson(Map json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    address = Address().addressFromJson(json['address']);
    company = Company().companyFromJson(json['company']);

    return UserModel(name: name,address: address,company: company,email:email ,id: id,phone:phone,username: username,website: website );
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address addressFromJson(Map json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = Geo().geoFromJson(json['geo']);

    return Address(
        city: city, geo: geo, street: street, suite: suite, zipcode: zipcode);
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo geoFromJson(Map json) {
    lat = json['lat'];
    lng = json['lng'];

    return Geo(lat: lat, lng: lng);
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company companyFromJson(Map json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
    return Company(bs: bs, catchPhrase: catchPhrase, name: name);
  }
}
