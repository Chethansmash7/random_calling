import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import './call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  //final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

//  @override
//  void dispose() {
//    // dispose input controller
//    _channelController.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Calling App'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 400,
          child: Column(
            children: <Widget>[
//              Row(
//                children: <Widget>[
//                  Expanded(
//                      child: TextField(
//                    controller: _channelController,
//                    decoration: InputDecoration(
//                      errorText:
//                          _validateError ? 'Channel name is mandatory' : null,
//                      border: UnderlineInputBorder(
//                        borderSide: BorderSide(width: 1),
//                      ),
//                      hintText: 'Channel name',
//                    ),
//                  ))
//                ],
////              ),
//              Column(
//                children: [
//                  ListTile(
//
//                    title: Text(ClientRole.Broadcaster.toString()),
//                    leading: Radio(
//                      value: ClientRole.Broadcaster,
//                      groupValue: _role,
//                      onChanged: (ClientRole value) {
//                        setState(() {
//                          _role = value;
//                        });
//                      },
//                    ),
//                  ),
//                  ListTile(
//                    title: Text(ClientRole.Audience.toString()),
//                    leading: Radio(
//                      value: ClientRole.Audience,
//                      groupValue: _role,
//                      onChanged: (ClientRole value) {
//                        setState(() {
//                          _role = value;
//                        });
//                      },
//                    ),
//                  )
//                ],
//              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.video_call),
                    color: Colors.black,
                    iconSize: 100,
                    onPressed: () {
                      //  String channelName= Random().nextInt(1000).toString();
                      String channelNameString = "123";
                      onJoin(channelNameString);
//                      print("Channel name " + channelName);
//                      onJoin(context, channelName);
//                      print("Channel name passed " + channelName);
                    },
                  ),
                ),
              ),
              Text(
                "Get started with a\nRandom Video Call",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
//              Padding(
//                padding: const EdgeInsets.symmetric(vertical: 20),
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: RaisedButton(
//                        onPressed: onJoin,
//                        child: Text('Join'),
//                        color: Colors.blueAccent,
//                        textColor: Colors.white,
//                      ),
//                    )
//                  ],
//                ),
//              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onJoin(String cns) async {
    // update input validation
//    setState(() {
//      _channelController.text.isEmpty
//          ? _validateError = true
//          : _validateError = false;
//    });

      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName:cns ,
            role: _role,
          ),
        ),
      );

  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
