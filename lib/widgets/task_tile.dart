import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    this.onTap,
    this.onDismissed,
  });

  final Task task;
  final VoidCallback? onTap;
  final VoidCallback? onDismissed;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDone = task.completed;

    Widget tile = Card(
      elevation: 0,
      color: scheme.surfaceContainerHighest,
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isDone ? scheme.primaryContainer : scheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            isDone ? Icons.check_rounded : Icons.timelapse_rounded,
            color: isDone ? scheme.onPrimaryContainer : scheme.onSecondaryContainer,
          ),
        ),
        title: Text(
          task.title.isEmpty ? '(untitled task)' : task.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                decoration: isDone ? TextDecoration.lineThrough : null,
              ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Icon(
                isDone ? Icons.verified_rounded : Icons.radio_button_unchecked_rounded,
                size: 16,
                color: isDone ? scheme.primary : scheme.outline,
              ),
              const SizedBox(width: 6),
              Text(isDone ? 'Done' : 'Pending'),
            ],
          ),
        ),
        trailing: onTap != null
            ? Icon(
                isDone ? Icons.check_circle : Icons.circle_outlined,
                color: isDone ? scheme.primary : scheme.outline,
              )
            : null,
      ),
    );

    if (onDismissed != null) {
      tile = Dismissible(
        key: ValueKey(task.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => onDismissed?.call(),
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: scheme.errorContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.delete_rounded, color: scheme.onErrorContainer),
        ),
        child: tile,
      );
    }

    return tile;
  }
}
