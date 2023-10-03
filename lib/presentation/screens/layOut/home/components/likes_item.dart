import 'package:flutter/material.dart';
import 'home_imports.dart';

class LikesItem extends StatefulWidget {
   const LikesItem({Key? key}) : super(key: key);

  @override
  State<LikesItem> createState() => _LikesItemState();
}

class _LikesItemState extends State<LikesItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSize.h17),
      itemCount: homeLikesList.length,
      itemBuilder: (context , index) =>ListTile(
        contentPadding: EdgeInsets.zero,
        title: CustomAppText(
          text: homeLikesList[index].title.tr(),
          textSize: 16.sp,
        ),
        trailing: InkWell(
          onTap: () =>setState(() {
            homeLikesList[index].value = !homeLikesList[index].value;
          }),
          child: SvgPicture.asset(
              homeLikesList[index].value ?
              AppIcons.likeSelectedIcon : AppIcons.likeIcon
          ),
        ),
      ),
      separatorBuilder: (context , index) =>const Divider(),
    );
  }
}