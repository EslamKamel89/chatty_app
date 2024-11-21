import 'package:chatty_app/pages/frame/message/index.dart';
import 'package:chatty_app/pages/frame/message/view/widgets/headbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // HttpUtil().get('/test').then((response) => pr(response, 'response'));
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    // backgroundColor: AppColors.primaryElement,
                    pinned: true,
                    title: HeadBar(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
