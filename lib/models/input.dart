import 'dart:convert';

class Input {
  bool residential;
  String? date;
  Address? address;
  String? recaptchaResponse;
  String? action;
  UserserviceconfigSet? userserviceconfigSet;
  String? additional;
  Recurrence? recurrence;
  Servicetype? servicetype;

  Input({
    required this.residential,
    this.date,
    this.address,
    this.userserviceconfigSet,
    this.additional,
    this.recurrence,
    this.servicetype,
  });

  factory Input.fromRawJson(String str) => Input.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Input.fromJson(Map<String, dynamic> json) => Input(
        residential: json['residential'],
        date: json["date"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        userserviceconfigSet: json["userserviceconfigSet"] == null
            ? null
            : UserserviceconfigSet.fromJson(json["userserviceconfigSet"]),
        additional: json["additional"],
        recurrence: json["recurrence"] == null
            ? null
            : Recurrence.fromJson(json["recurrence"]),
        servicetype: json["servicetype"] == null
            ? null
            : Servicetype.fromJson(json["servicetype"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "address": address?.toJson(),
        "userserviceconfigSet": userserviceconfigSet?.toJson(),
        "additional": additional,
        "recurrence": recurrence?.toJson(),
        "servicetype": servicetype?.toJson(),
      };
}

class Address {
  AddressCreate? create;

  Address({
    this.create,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        create: json["create"] == null
            ? null
            : AddressCreate.fromJson(json["create"]),
      );

  Map<String, dynamic> toJson() => {
        "create": create?.toJson(),
      };
}

class AddressCreate {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? address;
  String? address2;
  String? city;
  String? zipcode;
  String? country;

  AddressCreate({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.address,
    this.address2,
    this.city,
    this.zipcode,
    this.country,
  });

  factory AddressCreate.fromRawJson(String str) =>
      AddressCreate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressCreate.fromJson(Map<String, dynamic> json) => AddressCreate(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        address2: json["address2"],
        city: json["city"],
        zipcode: json["zipcode"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "address": address,
        "address2": address2,
        "city": city,
        "zipcode": zipcode,
        "country": country,
      };
}

class AddressConnect {
  AddressId? id;

  AddressConnect({
    this.id,
  });

  factory AddressConnect.fromRawJson(String str) =>
      AddressConnect.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressConnect.fromJson(Map<String, dynamic> json) => AddressConnect(
        id: json["id"] == null ? null : AddressId.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id?.toJson(),
      };
}

class AddressId {
  int? exact;

  AddressId({
    this.exact,
  });

  factory AddressId.fromRawJson(String str) =>
      AddressId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressId.fromJson(Map<String, dynamic> json) => AddressId(
        exact: json["exact"],
      );

  Map<String, dynamic> toJson() => {
        "exact": exact,
      };
}

class Id {
  String? exact;

  Id({
    this.exact,
  });

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        exact: json["exact"],
      );

  Map<String, dynamic> toJson() => {
        "exact": exact,
      };
}

class Recurrence {
  RecurrenceConnect? connect;

  Recurrence({
    this.connect,
  });

  factory Recurrence.fromRawJson(String str) =>
      Recurrence.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recurrence.fromJson(Map<String, dynamic> json) => Recurrence(
        connect: json["connect"] == null
            ? null
            : RecurrenceConnect.fromJson(json["connect"]),
      );

  Map<String, dynamic> toJson() => {
        "connect": connect?.toJson(),
      };
}

class RecurrenceConnect {
  Id? recurrence;

  RecurrenceConnect({
    this.recurrence,
  });

  factory RecurrenceConnect.fromRawJson(String str) =>
      RecurrenceConnect.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecurrenceConnect.fromJson(Map<String, dynamic> json) =>
      RecurrenceConnect(
        recurrence:
            json["recurrence"] == null ? null : Id.fromJson(json["recurrence"]),
      );

  Map<String, dynamic> toJson() => {
        "recurrence": recurrence?.toJson(),
      };
}

class Servicetype {
  ServicetypeConnect? connect;

  Servicetype({
    this.connect,
  });

  factory Servicetype.fromRawJson(String str) =>
      Servicetype.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Servicetype.fromJson(Map<String, dynamic> json) => Servicetype(
        connect: json["connect"] == null
            ? null
            : ServicetypeConnect.fromJson(json["connect"]),
      );

  Map<String, dynamic> toJson() => {
        "connect": connect?.toJson(),
      };
}

class ServicetypeConnect {
  Id? abbreviation;

  ServicetypeConnect({
    this.abbreviation,
  });

  factory ServicetypeConnect.fromRawJson(String str) =>
      ServicetypeConnect.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServicetypeConnect.fromJson(Map<String, dynamic> json) =>
      ServicetypeConnect(
        abbreviation: json["abbreviation"] == null
            ? null
            : Id.fromJson(json["abbreviation"]),
      );

  Map<String, dynamic> toJson() => {
        "abbreviation": abbreviation?.toJson(),
      };
}

class UserserviceconfigSet {
  List<Create>? create;

  UserserviceconfigSet({
    this.create,
  });

  factory UserserviceconfigSet.fromRawJson(String str) =>
      UserserviceconfigSet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserserviceconfigSet.fromJson(Map<String, dynamic> json) =>
      UserserviceconfigSet(
        create: json["create"] == null
            ? []
            : List<Create>.from(json["create"]!.map((x) => Create.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "create": create == null
            ? []
            : List<dynamic>.from(create!.map((x) => x.toJson())),
      };
}

class Create {
  Parameter? parameter;
  int? quantity;

  Create({
    this.parameter,
    this.quantity,
  });

  factory Create.fromRawJson(String str) => Create.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Create.fromJson(Map<String, dynamic> json) => Create(
        parameter: json["parameter"] == null
            ? null
            : Parameter.fromJson(json["parameter"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "parameter": parameter?.toJson(),
        "quantity": quantity,
      };
}

class Parameter {
  ParameterConnect? connect;

  Parameter({
    this.connect,
  });

  factory Parameter.fromRawJson(String str) =>
      Parameter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
        connect: json["connect"] == null
            ? null
            : ParameterConnect.fromJson(json["connect"]),
      );

  Map<String, dynamic> toJson() => {
        "connect": connect?.toJson(),
      };
}

class ParameterConnect {
  Id? parameter;

  ParameterConnect({
    this.parameter,
  });

  factory ParameterConnect.fromRawJson(String str) =>
      ParameterConnect.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParameterConnect.fromJson(Map<String, dynamic> json) =>
      ParameterConnect(
        parameter:
            json["parameter"] == null ? null : Id.fromJson(json["parameter"]),
      );

  Map<String, dynamic> toJson() => {
        "parameter": parameter?.toJson(),
      };
}
