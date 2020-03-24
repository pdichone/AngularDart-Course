import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:student_dashboard_final/src/student_dashboard/route_paths.dart';
import 'package:student_dashboard_final/src/student_dashboard/routes.dart';
import 'package:student_dashboard_final/src/student_dashboard/service/announce_service.dart';
import 'package:student_dashboard_final/src/student_dashboard/service/student_service.dart';
import 'package:student_dashboard_final/src/student_dashboard/student_list/student_list_component.dart';

@Component(
    selector: 'my-app',
    styleUrls: ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: [routerDirectives, StudentListComponent],
    exports: [RoutePaths, Routes],
    providers: [ClassProvider(AnnounceService), ClassProvider(StudentService)])
class AppComponent {}
