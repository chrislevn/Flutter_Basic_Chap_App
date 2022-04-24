import 'package:flutter/material.dart';
import 'package:chatapp_flutter/models/chat_user_model.dart';
import 'package:chatapp_flutter/widgets/conversation_list.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers("Augustana College", "Hello world", "https://www.augustana.edu/files/styles/inline_image_left_right/public/2018-06/Medallion_294_109_0.jpg?itok=MWf2QQMn", "Now"),
    ChatUsers("Virginia Tech University", "Wanna meet up", "https://images.footballfanatics.com/FFImage/thumb.aspx?i=/productimages/_4457000/altimages/ff_4457212-cb39e7db47049adb80b9alt1_full.jpg&w=900", "Yesterday"),
    ChatUsers("Arizona State University", "What's up?", "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/Arizona_State_University_seal.svg/1200px-Arizona_State_University_seal.svg.png", "Yesterday"),
    ChatUsers("Jane Russel", "Awesome Setup", "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80", "Now"),
    ChatUsers("Glady's Murphy","That's Great", "https://images.unsplash.com/photo-1485206412256-701ccc5b93ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=894&q=80", "Yesterday"),
    ChatUsers("Jorge Henry", "Hey where are you?","https://images.unsplash.com/photo-1496360166961-10a51d5f367a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", "31 Mar"),
    ChatUsers( "Philip Fox", "Busy! Call me in 20 mins", "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",  "28 Mar"),
    ChatUsers( "Debra Hawkins",  "Thankyou, It's awesome",  "https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",  "23 Mar"),
    ChatUsers( "Jacob Pena",  "will update you in evening", "https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1448&q=80",  "17 Mar"),
    ChatUsers( "Andrey Jones",  "Can you please share the file?",  "https://images.unsplash.com/photo-1517462964-21fdcec3f25b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",  "24 Feb"),
    ChatUsers( "John Wick",  "How are you?",  "https://images.unsplash.com/photo-1492288991661-058aa541ff43?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",  "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // We are making the whole page scrollable
        body: SingleChildScrollView(
          // Give the bouncing effect when a user's scrolling
          // reaches the end or beginning
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Conversations",style: TextStyle(fontSize: 32,
                          fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 2,
                            bottom: 2
                        ),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.pink[50],
                        ),
                        child: Row(
                          children: const <Widget>[
                            Icon(Icons.add,color: Colors.pink,size: 20,),
                            SizedBox(width: 2,),
                            Text("Add New",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // TODO: Uncomment this
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

            // TODO: Uncomment this
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