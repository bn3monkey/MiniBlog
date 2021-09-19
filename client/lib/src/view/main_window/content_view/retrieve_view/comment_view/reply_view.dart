import 'package:flutter/material.dart';

import 'package:client/src/auxiliary/asset_path.dart';
import 'package:client/src/auxiliary/date_time_converter.dart';

import 'package:client/src/model/user.dart';
import 'package:client/src/model/reply.dart';
import 'reply_item_view.dart';

class ReplyView extends StatefulWidget {
  ReplyView({Key? key, required this.replies}) : super(key: key);

  final List<Reply> replies;

  User current_user =
      User(id: 6, name: "샌즈", profile: "image/test/profile2.png");

  @override
  State<StatefulWidget> createState() => _ReplyViewState();
}

class _ReplyViewState extends State<ReplyView> {
  Widget getListView(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.replies.length,
        itemBuilder: (context, int index) {
          return ReplyItemView(reply: widget.replies[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return getListView(context);
  }
}
