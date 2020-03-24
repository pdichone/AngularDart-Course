import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
   static final studentList = RoutePath(path: 'students'); //.../students/hdadfre
   static final announcements = RoutePath(path: 'announcements');
   static final student = RoutePath(path: '${studentList.path}/:$idParam');
   static final addStudent = RoutePath(path: 'add-student');
}
String getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  print("ID: $id");
  if (id == null) {
    return null;
  } else {
    return id;
  }
}