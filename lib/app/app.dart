import 'package:todo_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:todo_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo_app/ui/views/home/home_view.dart';
import 'package:todo_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/dialogs/edit/edit_dialog.dart';
import 'package:todo_app/ui/dialogs/delete/delete_dialog.dart';
import 'package:todo_app/services/firestore_service_service.dart';
import 'package:todo_app/ui/views/add_notes/add_notes_view.dart';
import 'package:todo_app/ui/views/edit_screen/edit_screen_view.dart';
import 'package:todo_app/ui/views/login/login_view.dart';
import 'package:todo_app/services/authentication_service.dart';
import 'package:todo_app/ui/views/sign_up/sign_up_view.dart';
import 'package:todo_app/ui/views/reset_password/reset_password_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: AddNotesView),
    MaterialRoute(page: EditScreenView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: ResetPasswordView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: FirestoreServiceService),
    LazySingleton(classType: AuthenticationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: EditDialog),
    StackedDialog(classType: DeleteDialog),
// @stacked-dialog
  ],
)
class App {}
