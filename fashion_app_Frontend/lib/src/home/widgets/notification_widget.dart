import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../../common/services/storage.dart';
import '../../../common/widgets/login_bottom_sheet.dart';

class NotificationWidet extends StatelessWidget {
  const NotificationWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(Storage().getString('accessToken') == null){
          loginBottomSheet(context);
        }else{
          context.push('/notifications');
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: CircleAvatar(
          backgroundColor: Kolors.kGrayLight.withOpacity(0.3),
          child: const Badge(
            label: Text('4'),
            child: Icon(Ionicons.notifications,color: Kolors.kPrimary,),
          ),
        ),
      ),
    );
  }
}
