import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ddd/application/auth/auth_bloc.dart';
import 'package:ddd/application/notes/note_actor/note_actor_bloc.dart';
import 'package:ddd/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:ddd/injection.dart';
import 'package:ddd/presentation/notes/notes_overview/widgets/uncompleted_switch_widget.dart';
import 'package:ddd/presentation/routes/router.gr.dart';
import 'package:ddd/presentation/notes/notes_overview/widgets/notes_overview_body_widget.dart';

class NotesOverviewPage extends StatelessWidget {
  const NotesOverviewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) =>
                    ExtendedNavigator.of(context).replace(Routes.signInPage),
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) => FlushbarHelper.createError(
                  message: state.noteFailure.map(
                    unexpected: (_) =>
                        'Unexpected error occured while deleting, please contact support.',
                    insufficientPermission: (_) => 'Insufficient permission',
                    unableToUpdate: (_) => 'Impossible error',
                  ),
                  duration: const Duration(seconds: 5),
                ).show(context),
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () =>
                  context.bloc<AuthBloc>().add(const AuthEvent.signedOut()),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [
              const UncompletedSwitch(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => ExtendedNavigator.of(context)
                .pushNoteFormPage(editedNote: null),
            child: const Icon(Icons.add),
          ),
          body: const NotesOverviewBody(),
        ),
      ),
    );
  }
}
