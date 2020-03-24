import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular/angular.dart';
import 'package:student_dashboard_final/src/student_dashboard/model/student.dart';
import 'package:student_dashboard_final/src/student_dashboard/service/student_service.dart';

import '../route_paths.dart';

@Component(
  selector:'add-student',
  styleUrls: ['student_add_component.css'],
  templateUrl: 'student_add_component.html',
  directives: [coreDirectives, formDirectives]
)
class StudentAddComponent {
  final Router _router;
  final StudentService _studentService;

  Student student = Student();

  StudentAddComponent(this._router, this._studentService);

  void submitStudent(NgForm newStudent) async {
     var value = newStudent.value;
     var student = Student(
        firstName: value['firstName'],
       lastName: value['lastName'],
       age: value['age'],
       photoUrl: value['photoUrl'],
       description: value['description']
     );

    await _studentService.addStudent(student);

     await gotoStudentList();
  }

  String _studentListUrl() => RoutePaths.studentList.toUrl();
  Future<NavigationResult> gotoStudentList() => _router.navigate(_studentListUrl());


}