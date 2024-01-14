import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class BagianTiga extends StatelessWidget {
  static const routesName = '/home/chat';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ChatList(
            imageUrl: "https://picsum.photos/id/$index/200/300",
            title: faker.person.name(),
            subtitle: faker.lorem.sentence(),
          );
        },
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  ChatList(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      contentPadding: EdgeInsets.all(10),
      trailing: Text(DateFormat.Hm().format(DateTime.now())),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      title: Text(title),
      autofocus: true,
    );
  }
}
