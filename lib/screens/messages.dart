import 'package:flutter/material.dart';

class Message {
  final String sender;
  final String content;
  final DateTime time;

  Message({
    required this.sender,
    required this.content,
    required this.time,
  });
}

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<Message> messages = [
    Message(
      sender: "John Doe",
      content: "Bonjour, j'ai une question sur mon traitement.",
      time: DateTime.now(),
    ),
    Message(
      sender: "Dr. Smith",
      content: "Bonjour, je suis là pour vous aider. Quelle est votre question ?",
      time: DateTime.now().add(Duration(minutes: 5)),
    ),
  ];

  TextEditingController _textEditingController = TextEditingController();
  bool _isEditing = false;
  int _editingIndex = -1;

  void _sendMessage() {
    String messageText = _textEditingController.text.trim();
    if (messageText.isNotEmpty) {
      if (_isEditing && _editingIndex >= 0 && _editingIndex < messages.length) {
        Message editedMessage = Message(
          sender: messages[_editingIndex].sender,
          content: messageText,
          time: messages[_editingIndex].time,
        );
        setState(() {
          messages[_editingIndex] = editedMessage;
          _isEditing = false;
          _editingIndex = -1;
        });
      } else {
        Message newMessage = Message(
          sender: "John Doe",
          content: messageText,
          time: DateTime.now(),
        );
        setState(() {
          messages.add(newMessage);
        });
      }
      _textEditingController.clear();
    }
  }

  void _editMessage(int index) {
    setState(() {
      _isEditing = true;
      _editingIndex = index;
      _textEditingController.text = messages[index].content;
    });
  }

  void _deleteMessage(int index) {
    setState(() {
      messages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                Message message = messages[index];
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: InkWell(
                onTap: () {
                if (!_isEditing) {
                _editMessage(index);
                }
                },
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                ),
                SizedBox(width: 8.0),
                Expanded(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                message.sender,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                ),
                ),

                                  SizedBox(height: 4.0),
                                  Text(
                                    message.content,
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ),


                            SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => _editMessage(index),
                                  icon: Icon(Icons.edit),
                                  color: Colors.blue,
                                  iconSize: 20.0,
                                ),
                                IconButton(
                                  onPressed: () => _deleteMessage(index),
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  iconSize: 20.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Votre message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
