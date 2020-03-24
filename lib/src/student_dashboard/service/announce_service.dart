import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:student_dashboard_final/src/student_dashboard/model/Announcement.dart';

@Injectable()
class AnnounceService {
   List<Announcement> announcements = [
     Announcement(1, 'Students Need to Study', 'Finals are approaching, so you need to study'),
     Announcement(2, 'Vaccine', 'Vaccination will happen soon. Make sure to report tomorrow morning at the HUB'),
     Announcement(3, 'End of Year Celebration', 'If you\'re a senior or just a student, please come celebrate with us.'),
   ];
   Future<List<Announcement>> getAll() async => announcements;
}
