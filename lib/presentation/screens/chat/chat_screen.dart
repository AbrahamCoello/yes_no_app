import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_view.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://s.iw.ro/gateway/g/ZmlsZVNvdXJjZT1odHRwJTNBJTJGJTJG/c3RvcmFnZWZpbG1ub3cucmNzLXJkcy5y/byUyRnN0b3JhZ2UlMkYyMDIzJTJGMDcl/MkYxNCUyRjE3NjM3NTFfMTc2Mzc1MV9t/YXJnb3Qtcm9iYmllLmpwZyZ3PTc4MCZo/PTQwMCZoYXNoPWEyYTY5ZWU4Yzg2YTNkOWJkZWMxMWZmZTczNzRmZmU4.thumb.jpg'),
          ),
        ),
        title: const Text('Margot Robie '),
      ),
      body: const ChatView(),
    );
  }
}
