import 'package:auto_route/auto_route.dart';

// // import '../../feature/startUp/presentation/page/start_up.dart';
// // import '../../feature/login/presentation/page/login_page.dart';
// // import '../../feature/Home/presentation/pages/home.dart';
// // import '../../feature/Home/presentation/pages/faq.dart';
// // import '../../feature/Home/presentation/pages/main.dart';
// // import '../../feature/Home/presentation/pages/settings_page.dart';
// // import '../../feature/Home/presentation/pages/smart_pay.dart';
// // import '../../feature/Home/presentation/pages/bank_transfer.dart';
// // import '../../feature/Home/presentation/pages/transfer.dart';
import 'router.gr.dart';



@AutoRouterConfig(replaceInRouteName: 'Page')

class AppRouter extends $AppRouter  {

  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: StartUpPageRoute.page, initial: true),

    AutoRoute(page: LoginPageRoute.page),

    AutoRoute(page: MainPageRoute.page),

    AutoRoute(page: HomePageRoute.page),

    AutoRoute(page: SmartPayPageRoute.page),

    AutoRoute(page: TransferPageRoute.page),

    AutoRoute(page: BankTransferPageRoute.page),

    AutoRoute(page: SettingsPageRoute.page),

    AutoRoute(page: FaqPageRoute.page),

    

  ];
}
