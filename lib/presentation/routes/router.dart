import 'package:auto_route/auto_route_annotations.dart';
import 'package:ddd/presentation/notes/note_form/note_form_page.dart';
import 'package:ddd/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:ddd/presentation/sign_in/sign_in_page.dart';
import 'package:ddd/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: NotesOverviewPage),
    MaterialRoute(page: NoteFormPage, fullscreenDialog: true),
  ],
)
class $Router {}
