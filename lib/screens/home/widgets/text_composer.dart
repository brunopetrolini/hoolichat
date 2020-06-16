import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TextComposer extends StatefulWidget {
  final Function({String message, File imgFile}) _sendMessage;

  TextComposer(this._sendMessage);

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controller = TextEditingController();

  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[200]),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.photo_camera,
              color: Theme.of(context).buttonColor,
            ),
            onPressed: () async {
              File imgFile =
                  await ImagePicker.pickImage(source: ImageSource.gallery);

              if (imgFile == null) return;
              widget._sendMessage(imgFile: imgFile);
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration.collapsed(
                  hintText: "Escreva sua mensagem..."),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).buttonColor,
            onPressed: _isComposing
                ? () {
                    widget._sendMessage(message: _controller.text);
                    _controller.clear();
                    setState(() {
                      _isComposing = false;
                    });
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
