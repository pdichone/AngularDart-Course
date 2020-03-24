
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:student_dashboard_final/src/student_dashboard/model/Announcement.dart';
import 'package:student_dashboard_final/src/student_dashboard/service/announce_service.dart';

@Component(
  selector: 'student-ann',
  styleUrls: ['student_announcement_component.css'],
  templateUrl: 'student_announcement_component.html',
  directives: [coreDirectives]
)
class StudentAnnouncementComponent implements OnInit{
  List<Announcement> announcements;
  final AnnounceService _announceService;
  final Router _router;

  StudentAnnouncementComponent(this._announceService, this._router);


  @override
  void ngOnInit() async {
    announcements = await _announceService.getAll();

  }

}
