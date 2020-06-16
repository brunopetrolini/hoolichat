import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool myMsg;

  ChatMessage(this.data, this.myMsg);

  @override
  Widget build(BuildContext context) {
    if (!myMsg) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(data["senderPhotoURL"]),
            ),
            SizedBox(width: 5),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: Colors.grey[200],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    data["imgURL"] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              data["imgURL"],
                              width: 250,
                            ),
                          )
                        : Text(
                            data["message"],
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                    SizedBox(height: 5),
                    Text(
                      data["senderName"],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    data["imgURL"] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              data["imgURL"],
                              width: 250,
                            ),
                          )
                        : Text(
                            data["message"],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.end,
                          ),
                    SizedBox(height: 5),
                    Text(
                      data["senderName"],
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFA07ACC),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 5),
            CircleAvatar(
              backgroundImage: NetworkImage(data["senderPhotoURL"]),
            ),
          ],
        ),
      );
    }
  }
}
