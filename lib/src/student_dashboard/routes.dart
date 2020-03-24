import 'package:angular_router/angular_router.dart';
import 'package:student_dashboard_final/src/student_dashboard/route_paths.dart';

import 'student_list/student_list_component.template.dart' as student_list_component;
import 'student_component/student_component.template.dart' as student_template;

import 'student_add_component/student_add_component.template.dart' as student_add_template;
import 'not_found_template.template.dart' as not_found_template;

import 'student_announcements/student_announcement_component.template.dart' as student_announcements_component;

class Routes {
  static final students = RouteDefinition(
    routePath: RoutePaths.studentList,
    component: student_list_component.StudentListComponentNgFactory,
  );

  static final add_student = RouteDefinition(
    routePath: RoutePaths.addStudent,
    component: student_add_template.StudentAddComponentNgFactory,
  );

  static final student = RouteDefinition(
      routePath: RoutePaths.student,
     component: student_template.StudentComponentNgFactory
  );

  static final announcements = RouteDefinition(
    routePath: RoutePaths.announcements,
    component: student_announcements_component
        .StudentAnnouncementComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    students,
    student,
    announcements,
    add_student,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.announcements.toUrl()
    ),
    RouteDefinition(
       path: '.*',
       component: not_found_template.NotFoundComponentNgFactory
    )
  ];
}