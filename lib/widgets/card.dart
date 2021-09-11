import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:donna/model/buttons.dart';

class VoiceCard extends StatelessWidget {
  final FlutterTts flutterTts =FlutterTts();
  final imageUrl, subtitle, content;
  VoiceCard(
      {Key? key,
      this.content="Hi",
      this.imageUrl = "assets/gradient-background-2.jpg",
      this.subtitle = "Bring me water"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    speak() async{
      // await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
      await flutterTts.speak(content);
    }
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: ()=>speak(),
            child: Container(
              height: 203,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xff707070),
                  width: 1,
                ),
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                      child: Text(
                        subtitle,
                        style: TextStyle(fontSize: 36, color: Colors.white),
                        maxLines: 4,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
