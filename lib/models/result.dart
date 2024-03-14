import 'dart:convert';

class Result {
  bool? residential;
  String id;
  DateTime date;
  Servicetype servicetype;
  int duration;
  Serviceteam serviceteam;
  dynamic user;
  Address address;
  String additional;
  int rating;
  dynamic comments;
  CreatedBy createdBy;
  Recurrence recurrence;
  UserserviceconfigSet userserviceconfigSet;
  double bonusNewer;
  double bonusWallet;
  double bonusPromotions;
  double discountPromotions;
  double bonusRecurrence;
  double discountRecurrence;
  double price;
  double priceest;
  double extraprice;
  double totalprice;

  Result({
    required this.residential,
    required this.id,
    required this.date,
    required this.servicetype,
    required this.duration,
    required this.serviceteam,
    required this.user,
    required this.address,
    required this.additional,
    required this.rating,
    required this.comments,
    required this.createdBy,
    required this.recurrence,
    required this.userserviceconfigSet,
    required this.bonusNewer,
    required this.bonusWallet,
    required this.bonusPromotions,
    required this.discountPromotions,
    required this.bonusRecurrence,
    required this.discountRecurrence,
    required this.price,
    required this.priceest,
    required this.extraprice,
    required this.totalprice,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        residential: json["residential"],
        id: json["id"],
        date: DateTime.parse(json["date"]),
        servicetype: Servicetype.fromJson(json["servicetype"]),
        duration: json["duration"],
        serviceteam: Serviceteam.fromJson(json["serviceteam"]),
        user: json["user"],
        address: Address.fromJson(json["address"]),
        additional: json["additional"],
        rating: json["rating"],
        comments: json["comments"],
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        recurrence: Recurrence.fromJson(json["recurrence"]),
        userserviceconfigSet:
            UserserviceconfigSet.fromJson(json["userserviceconfigSet"]),
        bonusNewer: json["bonusNewer"],
        bonusWallet: json["bonusWallet"],
        bonusPromotions: json["bonusPromotions"],
        discountPromotions: json["discountPromotions"],
        bonusRecurrence: json["bonusRecurrence"],
        discountRecurrence: json["discountRecurrence"],
        price: json["price"],
        priceest: json["priceest"],
        extraprice: json["extraprice"],
        totalprice: json["totalprice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "servicetype": servicetype.toJson(),
        "duration": duration,
        "serviceteam": serviceteam.toJson(),
        "user": user,
        "address": address.toJson(),
        "additional": additional,
        "rating": rating,
        "comments": comments,
        "createdBy": createdBy.toJson(),
        "recurrence": recurrence.toJson(),
        "userserviceconfigSet": userserviceconfigSet.toJson(),
        "bonusNewer": bonusNewer,
        "bonusWallet": bonusWallet,
        "bonusPromotions": bonusPromotions,
        "discountPromotions": discountPromotions,
        "bonusRecurrence": bonusRecurrence,
        "discountRecurrence": discountRecurrence,
        "price": price,
        "priceest": priceest,
        "extraprice": extraprice,
        "totalprice": totalprice,
      };
}

class Address {
  String address;
  String firstName;
  String city;
  String country;

  Address({
    required this.address,
    required this.firstName,
    required this.city,
    required this.country,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        firstName: json["firstName"],
        city: json["city"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "firstName": firstName,
        "city": city,
        "country": country,
      };
}

class CreatedBy {
  String email;

  CreatedBy({
    required this.email,
  });

  factory CreatedBy.fromRawJson(String str) =>
      CreatedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}

class Recurrence {
  String id;
  String recurrence;
  double bonus;

  Recurrence({
    required this.id,
    required this.recurrence,
    required this.bonus,
  });

  factory Recurrence.fromRawJson(String str) =>
      Recurrence.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recurrence.fromJson(Map<String, dynamic> json) => Recurrence(
        id: json["id"],
        recurrence: json["recurrence"],
        bonus: json["bonus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recurrence": recurrence,
        "bonus": bonus,
      };
}

class Serviceteam {
  String id;
  String team;

  Serviceteam({
    required this.id,
    required this.team,
  });

  factory Serviceteam.fromRawJson(String str) =>
      Serviceteam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Serviceteam.fromJson(Map<String, dynamic> json) => Serviceteam(
        id: json["id"],
        team: json["team"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team": team,
      };
}

class Servicetype {
  String servicetype;

  Servicetype({
    required this.servicetype,
  });

  factory Servicetype.fromRawJson(String str) =>
      Servicetype.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Servicetype.fromJson(Map<String, dynamic> json) => Servicetype(
        servicetype: json["servicetype"],
      );

  Map<String, dynamic> toJson() => {
        "servicetype": servicetype,
      };
}

class UserserviceconfigSet {
  List<Node> nodes;

  UserserviceconfigSet({
    required this.nodes,
  });

  factory UserserviceconfigSet.fromRawJson(String str) =>
      UserserviceconfigSet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserserviceconfigSet.fromJson(Map<String, dynamic> json) =>
      UserserviceconfigSet(
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class Node {
  Parameter parameter;
  int quantity;
  double extraprice;
  double total;

  Node({
    required this.parameter,
    required this.quantity,
    required this.extraprice,
    required this.total,
  });

  factory Node.fromRawJson(String str) => Node.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        parameter: Parameter.fromJson(json["parameter"]),
        quantity: json["quantity"],
        extraprice: json["extraprice"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "parameter": parameter.toJson(),
        "quantity": quantity,
        "extraprice": extraprice,
        "total": total,
      };
}

class Parameter {
  String parameter;

  Parameter({
    required this.parameter,
  });

  factory Parameter.fromRawJson(String str) =>
      Parameter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
        parameter: json["parameter"],
      );

  Map<String, dynamic> toJson() => {
        "parameter": parameter,
      };
}
