import 'package:decor_home_app/core/theme/colors.dart';
import 'package:decor_home_app/core/theme/fonts.dart';
import 'package:decor_home_app/features/navigator/tabbar.dart';
import 'package:decor_home_app/features/presentation/pages/category/kitchen.dart';
import 'package:flutter/material.dart';

class BestSellCard extends StatelessWidget {
  final String text;
  const BestSellCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorsApp.salmon,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(text, style: FontsApp.title(color: ColorsApp.orangeDark, fontSize: 17),),
          SizedBox(height: 15,),
          SizedBox(
            width: 200,
            child: Text('Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.', style: FontsApp.subTitle(color: ColorsApp.orangeDark, fontSize: 12),
                maxLines: 3,
              )
          ),
          SizedBox(height: 15,),
          SizedBox(
            width: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    color: ColorsApp.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Row(
                        children: [
                          Icon(Icons.star_outlined, color: ColorsApp.salmon, size: 13,),
                          SizedBox(width: 8),
                          Text('4.5', style: FontsApp.subText(color: ColorsApp.dark, fontSize: 13)
                          )],
                      ),
                    )),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  color: ColorsApp.white,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainTabPage(initialIndex: 4)));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text('Click More', style: FontsApp.subText(color: ColorsApp.dark, fontSize: 13),),
                    ),
                  ),
                )
              ],
            ),
          )

    ]));
  }
}
