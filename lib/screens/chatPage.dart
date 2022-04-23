import 'package:flutter/material.dart';
import 'package:chatapp_flutter/models/chatUsersModel.dart';
import 'package:chatapp_flutter/widgets/conversationList.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers("Jane Russel", "Awesome Setup", "lib/images/userImage1.jpeg", "Now"),
    ChatUsers("Glady's Murphy","That's Great", "lib/images/userImage2.jpeg", "Yesterday"),
    ChatUsers("Jorge Henry", "Hey where are you?","lib/images/userImage3.jpeg", "31 Mar"),
    ChatUsers( "Philip Fox", "Busy! Call me in 20 mins", "lib/images/userImage4.jpeg",  "28 Mar"),
    ChatUsers( "Debra Hawkins",  "Thankyou, It's awesome",  "lib/images/userImage5.jpeg",  "23 Mar"),
    ChatUsers( "Jacob Pena",  "will update you in evening", "lib/images/userImage6.jpeg",  "17 Mar"),
    ChatUsers( "Andrey Jones",  "Can you please share the file?",  "lib/images/userImage7.jpeg",  "24 Feb"),
    ChatUsers( "John Wick",  "How are you?",  "lib/images/userImage8.jpeg",  "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  chatUsers[index].name,
                  chatUsers[index].messageText,
                  chatUsers[index].imageURL,
                  chatUsers[index].time,
                  (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}