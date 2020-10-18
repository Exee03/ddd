import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ddd/application/notes/note_actor/note_actor_bloc.dart';
import 'package:ddd/domain/notes/note.dart';
import 'package:kt_dart/kt.dart';
import 'package:ddd/domain/notes/todo_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ddd/presentation/routes/router.gr.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key key,
    @required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.getOrCrash(),
      child: InkWell(
        onTap: () =>
            ExtendedNavigator.of(context).pushNoteFormPage(editedNote: note),
        onLongPress: () {
          final noteActorBloc = context.bloc<NoteActorBloc>();
          _showDelectionDialog(context, noteActorBloc);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.body.getOrCrash(),
                style: const TextStyle(fontSize: 18),
              ),
              if (note.todos.length > 0) ...[
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  children: [
                    ...note.todos
                        .getOrCrash()
                        .map(
                          (todoItem) => TodoDisplay(todo: todoItem),
                        )
                        .iter,
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _showDelectionDialog(BuildContext context, NoteActorBloc noteActorBloc) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected note:'),
          content: Text(note.body.getOrCrash(),
              maxLines: 3, overflow: TextOverflow.ellipsis),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            FlatButton(
              onPressed: () {
                noteActorBloc.add(NoteActorEvent.deleted(note));
                Navigator.pop(context);
              },
              child: const Text('DELETE'),
            )
          ],
        );
      },
    );
  }
}

class TodoDisplay extends StatelessWidget {
  const TodoDisplay({
    Key key,
    @required this.todo,
  }) : super(key: key);

  final TodoItem todo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (todo.done) const Icon(Icons.check_circle),
        if (!todo.done) const Icon(Icons.radio_button_unchecked),
        Text(todo.name.getOrCrash()),
      ],
    );
  }
}
