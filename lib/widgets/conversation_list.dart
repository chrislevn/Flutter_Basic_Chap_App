import 'package:flutter/material.dart';
import 'package:chatapp_flutter/screens/chat_detail_page.dart';

class ConversationList extends StatefulWidget{
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList( this.name, this.messageText, this.imageUrl, this.time, this.isMessageRead);
  @override
  _ConversationListState createState() => _ConversationListState();
}


class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {

    // Navigation
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatDetailPage(name: widget.name, imageUrl: widget.imageUrl);
        }));
      },

      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),

        // TODO: Uncomment this
        // Row Element
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  // Avatar
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),

                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //Name
                          Text(widget.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),

                          // Message text
                          Text(widget.messageText,style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                              fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Text(widget.time,style: TextStyle(
                fontSize: 12,
                fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),

            ),
          ],
        ),
      ),
    );
  }
}