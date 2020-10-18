import 'package:flutter/material.dart';
import 'package:ddd/domain/notes/note_failure.dart';

class CriticalFailureDisplay extends StatelessWidget {
  const CriticalFailureDisplay({
    Key key,
    @required this.failure,
  }) : super(key: key);

  final NoteFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '😨',
            style: TextStyle(fontSize: 100),
          ),
          Text(
            failure.maybeMap(
                insufficientPermission: (_) => 'Insufficient permission',
                orElse: () => 'Unexpected error. \nPlease, contact support'),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.mail),
                  const SizedBox(width: 4),
                  const Text('I need help'),
                ],
              ))
        ],
      ),
    );
  }
}
