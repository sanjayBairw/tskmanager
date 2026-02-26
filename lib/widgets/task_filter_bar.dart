import 'package:flutter/material.dart';

import '../providers/task_provider.dart';

class TaskFilterBar extends StatelessWidget {
  const TaskFilterBar({
    super.key,
    required this.value,
    required this.onChanged,
    required this.completedCount,
    required this.pendingCount,
  });

  final TaskFilter value;
  final ValueChanged<TaskFilter> onChanged;
  final int completedCount;
  final int pendingCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: ChoiceChip(
                avatar: const Icon(Icons.list_rounded, size: 18),
                label: const Text('All'),
                selected: value == TaskFilter.all,
                onSelected: (_) => onChanged(TaskFilter.all),
                showCheckmark: false,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ChoiceChip(
                avatar: const Icon(Icons.check_circle_rounded, size: 18),
                label: const Text('Done'),
                selected: value == TaskFilter.completed,
                onSelected: (_) => onChanged(TaskFilter.completed),
                showCheckmark: false,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ChoiceChip(
                avatar: const Icon(Icons.schedule_rounded, size: 18),
                label: const Text('Pending'),
                selected: value == TaskFilter.pending,
                onSelected: (_) => onChanged(TaskFilter.pending),
                showCheckmark: false,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _CountChip(label: 'Done', count: completedCount),
            _CountChip(label: 'Pending', count: pendingCount),
          ],
        ),
      ],
    );
  }
}

class _CountChip extends StatelessWidget {
  const _CountChip({required this.label, required this.count});

  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label: $count'),
      visualDensity: VisualDensity.compact,
    );
  }
}
