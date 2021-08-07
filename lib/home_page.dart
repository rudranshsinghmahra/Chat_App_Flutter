import 'package:chat_app_flutter/chat_message.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("WHATSAPP"),
      ),
      body: new ChatScreen()
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textEditingController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];

  void _handleSubmitted(String text){
    _textEditingController.clear();
    ChatMessage message = new ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }



    Widget _textComposerWidget() {
      return IconTheme(
        data: IconThemeData(
            color: Colors.green
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "Type Your Message Here"),
                  controller: _textEditingController,
                  onSubmitted: _handleSubmitted,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: IconButton(
                  icon: Icon(Icons.send_outlined),
                  onPressed: () {
                    _handleSubmitted(_textEditingController.text);
                  },
                ),
              )
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        new Flexible(child: ListView.builder(itemBuilder: (_,int index)=> _messages[index],
          reverse: true,
          padding: EdgeInsets.all(8.0),
          itemCount: _messages.length,
        ),
        ),
        Divider(
          height: 1,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }

}
