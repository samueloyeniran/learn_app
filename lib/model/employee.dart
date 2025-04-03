class Employee {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;
  // constructor
  // Employee({required this.id, required this.email, required this.firstName, required this.lastName, required this.avatar});
  //it's a constructor with named parameters
  // it's used to intialize the properties of the class
  Employee({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
  // "id": 7,
  //   "email": "michael.lawson@reqres.in",
  //   "first_name": "Michael",
  //   "last_name": "Lawson",
  //   "avatar": "https://reqres.in/img/faces/7-image.jpg"
  // the dynamic type is used to represent any type of data
  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}
