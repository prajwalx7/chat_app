import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeftPanel extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const LeftPanel({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      'assets/svg/chat.svg',
      'assets/svg/group.svg',
      'assets/svg/profile.svg',
      'assets/svg/settings.svg',
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () => onItemSelected(index),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? Colors.blueAccent.withValues(alpha: 0.2)
                      : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              items[index],
              height: 28,
              width: 28,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.blueAccent : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
    );
  }
}
