import 'package:flutter/material.dart';

// Import chat screen
import 'package:chatapp_flutter/screens/chat_page.dart';

class ChannelPage extends StatefulWidget{
  const ChannelPage({Key? key}) : super(key: key);

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel Screen'),
      ),
    );
  }
}