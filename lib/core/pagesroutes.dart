import 'package:best_foot_wears/controllers/home_controller.dart';
import 'package:best_foot_wears/core/bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/home_page.dart';

class Pages
{
static List<GetPage> all = [
GetPage(name: "/", page: ()=> HomePage(),binding: HomeBinding())
];
}
