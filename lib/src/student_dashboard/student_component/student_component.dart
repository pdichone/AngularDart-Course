
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:student_dashboard_final/src/student_dashboard/model/student.dart';
import 'package:student_dashboard_final/src/student_dashboard/service/student_service.dart';

import '../route_paths.dart';

@Component(
  selector: 'my-student',
  templateUrl: 'student_component.html',
  styleUrls: ['student_component.css'],
  directives: [coreDirectives, formDirectives]
)
class StudentComponent implements OnActivate{
  Student student;
  final StudentService _studentService;
  final Router _router;
  final Location _location;

  StudentComponent(this._studentService, this._router, this._location);

  @override
  void onActivate(_, RouterState current) async {
    try {
      final id = getId(current.parameters);
      if (id != null)  student = await (_studentService.get(id));
    }catch (e) {
      print('$e');
    }

  }

  void update(student) async {
      await _studentService.updateStudent(student);
  }
  void goBack() async {
    await _location.back();

//    await _router.navigate(RoutePaths.studentList.toUrl());

  }


}