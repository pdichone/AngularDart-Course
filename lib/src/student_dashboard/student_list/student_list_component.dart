import 'package:angular_router/angular_router.dart';
import 'package:angular/angular.dart';
import 'package:student_dashboard_final/src/student_dashboard/model/student.dart';
import 'package:student_dashboard_final/src/student_dashboard/service/student_service.dart';

import '../route_paths.dart';

@Component(
   selector: 'student-list',
  styleUrls: ['student_list_component.css'],
  templateUrl: 'student_list_component.html',
  directives: [coreDirectives]
)
class StudentListComponent implements OnInit {
  List<Student> studentList = [];
  final Router _router;
  final StudentService _studentService;
  Student selected;


  StudentListComponent(this._router, this._studentService);

  void onSelect(Student student) {
  //  print( student);
    selected = student;
    gotoDetail();
  }

  void delete(index, id) async {
     studentList.removeAt(index);
     await _studentService.deleteStudent(id);
  }
//
//  Future<NavigationResult> gotoDetail() {
//    print(selected.id);
//    //return _router.navigate(_studentUrl(selected.id));
//  }
  Future<NavigationResult> gotoDetail() => _router.navigate(_studentUrl(selected.id));
  Future<NavigationResult> gotoAddStudent() => _router.navigate(_addStudentUrl());

  @override
  void ngOnInit() async {
     studentList = await _studentService.getAll();
  }

  String _studentUrl(String id) => RoutePaths.student.toUrl(parameters: {idParam: '$id'});

  String _addStudentUrl() => RoutePaths.addStudent.toUrl();


}