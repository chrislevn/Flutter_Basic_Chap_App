import 'package:flutter/material.dart';

// Import screens
import 'package:chatapp_flutter/screens/chat_page.dart';
import 'package:chatapp_flutter/screens/profile_screen.dart';
import 'package:chatapp_flutter/screens/channel_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Selected index of the current tab
  int _selectedIndex = 0;

  /// Get the position of bottom navigation from [pos]
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return ChatPage();
      case 1:
        return ChannelPage();
      case 2:
        return ProfileScreen();
      default:
        return ChatPage();
    }
  }

  /// Get the position [index] of bottom navigation based on the icon tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

//       // TODOs: Comment this
//       body: Container(
//         child: Center(child: Text("Chat")),
//       ),
//     );
//   }
// }

      // TODO: Comment this
      // body: ChatPage(),

      // TODO: Uncomment this
      body: Center(
        child: _getDrawerItemWidget(_selectedIndex),
      ),

      // TODO: Uncomment this
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: "Channels",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],

        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}