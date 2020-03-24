import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/browser_client.dart';
import 'package:student_dashboard_final/app_component.template.dart' as ng;
import 'main.template.dart' as self;
import 'package:http/http.dart';

@GenerateInjector([
   routerProviders,
  ClassProvider(Client, useClass: BrowserClient)
]
)
final InjectorFactory injectorFactory = self.injectorFactory$Injector;
void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injectorFactory);
}
