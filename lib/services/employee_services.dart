// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart%20';
// import 'package:learn_app/model/employee.dart';

// class EmployeeServices {
//   String baseUrl = 'https://reqres.in/api/';
//   // this method is used to get the data from the api
//   getAllEmployeeData() async {
//     List<Employee> allEmployees =
//         []; // this is used to create a list of employees
//     try {
//       var response = await get(Uri.parse(baseUrl + 'users?page=2'));
//       // check if the response is successful
//       if (response.statusCode == 200) {
//         // if the response is successful, return the data

//         // print(response.body);
//         var Data = response.body; // this is used to get the data from the api

//         var decodedData = jsonDecode(
//           Data,
//         ); // this is used to decode the json data
//         var employees =
//             decodedData['data']; // this is used to get the data from the api
//         //print(employees); // this is used to print the data from the api
//         // print(decodedData['data'][0]['first_name']);// this is used to get the first name of the employee

//         for (var employee in employees) {
//           Employee newEmployee = Employee.fromJson(employees);

//           // this is used to create a new employee object from the json data

//           allEmployees.add(newEmployee);
//           // this is used to add the new employee object to the list of employees
//           print(allEmployees);
//           // this is used to print the list of employees
//         }
//         return allEmployees;
//         // this is used to return the list of employees
//       }
//     } catch (e) {
//       throw Exception(
//         'e.toString()',
//       ); // this is used to catch the error and throw the exception
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_app/model/employee.dart';

class EmployeeServices {
  String baseUrl = 'https://reqres.in/api/';

  // Method to get employee data from API
  Future<List<Employee>> getAllEmployeeData() async {
    List<Employee> allEmployees = [];

    try {
      var response = await http.get(Uri.parse('${baseUrl}users?page=2'));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var employees = decodedData['data'];

        for (var employee in employees) {
          Employee newEmployee = Employee.fromJson(employee);
          allEmployees.add(newEmployee);
        }
        print(allEmployees);
        return allEmployees;
      } else {
        throw Exception('Failed to load employees: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching employees: ${e.toString()}');
    }
  }
}
