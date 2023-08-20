import 'package:flutter/material.dart';

/*아이콘 버튼 클릭  */
class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        //아미지 아이콘의 사각형이 좀 더 커진다. padding의 두번재 기능?
        //여유공간을 채운다. 
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
          ),

        //이미지 아이콘의 사각형 흰색 외곽선이 생김.
        child: Image.asset(
          imagePath,
          height: 40,
        ));
  }
}
