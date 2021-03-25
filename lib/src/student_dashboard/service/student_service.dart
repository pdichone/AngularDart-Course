import 'dart:convert';

import 'package:angular/core.dart';
import 'package:angular/angular.dart';
import 'package:http/http.dart';
import 'package:student_dashboard_final/src/student_dashboard/model/student.dart';
import 'package:http/http.dart' as http;

@Injectable()
class StudentService {

  final Client _client;

  StudentService(this._client);

  final apiUrl = 'https://angulardartstudent.firebaseio.com/student.json';
  final _header = {'Content-type': 'application/json; charset=UTF-8'};

  List<Student> studentList = [
//    Student(
//        id: 'sdredff',
//        firstName: 'Lito',
//        lastName: 'Crilo',
//        age: 23,
//        photoUrl: 'https://i.picsum.photos/id/866/300/300.jpg',
//        description: 'Great Student'),
//    Student(
//        id: 'uuhdes',
//        firstName: 'Santos',
//        lastName: 'Garbanzo',
//        age: 18,
//        photoUrl: 'https://i.picsum.photos/id/836/300/300.jpg',
//        description: 'Okay Student'),
//    Student(
//        id: 'fhes4',
//        firstName: 'Fernando',
//        lastName: 'Chico',
//        age: 20,
//        photoUrl: 'https://i.picsum.photos/id/896/300/300.jpg',
//        description: 'TBD'),
//    Student(
//        id: '8dade',
//        firstName: 'Grazzio',
//        lastName: 'Karl',
//        age: 19,
//        photoUrl: 'https://i.picsum.photos/id/806/300/300.jpg',
//        description: 'Hmm...')
  ];
  dynamic _extractData(http.Response response) => json.decode(response.body);
  Future<List<Student>> getAll() async {
    studentList.clear();

    try{
      final response = await _client.get(apiUrl);
      final extractedData = _extractData(response) as Map<String, dynamic>;
      if (extractedData != null) {
         extractedData.forEach((key, value) {
            var values = value as Map<String, dynamic>;
            values['id'] = key;

            studentList.add(Student(
                id: values['id'],
              firstName: values['firstName'],
               lastName: values['lastName'],
              age: values['age'],
              photoUrl: values['photoUrl'],
              description: values['description']
            ));
         });
      }
      return studentList;


    }catch(e) {
       print(e);
    }
  }
  Future<void> updateStudent(Student selectedStudent) async {
    final newUrl = 'https://angulardartstudent.firebaseio.com/student/${selectedStudent.id}.json';
    try {
      await _client.patch(newUrl,
        headers: _header,
       body: json.encode(selectedStudent.asMap())).then((response) {
          // do nothing for now!
      });
    }catch(e) {
       print(e);
    }
  }

Future<void> deleteStudent(id) async {
  final newUrl = 'https://angulardartstudent.firebaseio.com/student/${id}.json';
  try{
    await _client.delete(newUrl).then((response) {
      print(response.body);
    });
  }catch(e) {
     print(e);
  }

}

  Future<Student> get(String id) async =>
      (await getAll()).firstWhere((student) => student.id == id);

  Future<void> addStudent(Student student) async {
    try {
      await _client
          .post(apiUrl, headers: _header, body: json.encode(student.asMap()))
          .then((response) {
        var newStudent = Student(
            id: json.decode(response.body)['name'],
            firstName: student.firstName,
            lastName: student.lastName,
            age: student.age,
            photoUrl: student.photoUrl,
            description: student.description);
        studentList.add(newStudent);
      });

      print('Size: ${studentList.length}');
    } catch (e) {
      print(e);
    }
  }
}
