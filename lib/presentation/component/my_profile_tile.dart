import 'package:flutter/material.dart';
import 'package:pet_care/business/constant/my_colors.dart';

class MyProfileTile extends StatelessWidget {
  final String tileText;
  final Widget leadingIcon;
  final IconData trailingIcon;
  final Function()? onTap;

  const MyProfileTile({
    Key? key,
    required this.tileText,
    required this.leadingIcon,
    required this.trailingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: MyColors.violet.withOpacity(0.3),
                child: leadingIcon),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: MyColors.light_grey2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tileText),
                    Icon(
                      trailingIcon,
                      color: MyColors.grey,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
