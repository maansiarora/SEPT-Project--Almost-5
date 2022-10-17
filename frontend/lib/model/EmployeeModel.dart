/*import 'dart:convert';

EmployeeModel employeeModelJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  int id;
  String firstName;
  String lastName;
  String password;

  EmployeeModel(
      {this.id = 0,
      this.firstName = 'Hi',
      this.lastName = 'Hello',
      this.password = 'xyz'});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      firstName: json["firstName"],
      lastName: json["lastName"],
      id: json["id"],
      password: json["password"]);

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        'id': id,
        "password": password,
      };

  String get firstname => firstName;

  String get lastname => lastName;

  String get password => password;
}*/
