import 'dart:convert';

doctorSignUpModel employeeModelJson(String str) =>
    doctorSignUpModel.fromJson(json.decode(str));

String employeeModelToJson(doctorSignUpModel data) =>
    json.encode(data.toJson());

class doctorSignUpModel {
  int id;
  String firstName;
  String lastName;
  String Password;

  doctorSignUpModel(
      {this.id = 1,
      this.firstName = 'Hi',
      this.lastName = 'Hello',
      this.Password = 'xyz'});

  factory doctorSignUpModel.fromJson(Map<String, dynamic> json) =>
      doctorSignUpModel(
          firstName: json["firstName"],
          lastName: json["lastName"],
          id: json["id"],
          Password: json["Password"]);

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        'id': id,
        "Password": Password,
      };

  String get firstname => firstName;

  String get lastname => lastName;

  String get password => Password;
}
