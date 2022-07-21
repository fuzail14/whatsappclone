import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget openPopUp() {
      return PopupMenuButton(
        itemBuilder: (context) {
          return List.generate(
              3,
              (index) => const PopupMenuItem(
                    child: Text('Setting'),
                  ));
        },
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff128C7E),
          title: const Text('WhatsApp'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                  iconMargin: EdgeInsets.all(100),
                  child: Icon(
                    Icons.camera_alt_rounded,
                  )),
              Tab(
                child: Text('CHATS', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text('STATUS', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text('CALLS', style: TextStyle(color: Colors.white)),
              ),
            ],
            labelColor: Colors.white,
          ),
          actions: [
            InkWell(child: Icon(Icons.search), onTap: () {}),
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              itemBuilder: (context) {
                return [
                  // In this case, we need 5 popupmenuItems one for each option.
                  const PopupMenuItem(child: Text('New Group')),
                  const PopupMenuItem(child: Text('New Broadcast')),
                  const PopupMenuItem(child: Text('Linked Devices')),
                  const PopupMenuItem(child: Text('Starred Messages')),
                  const PopupMenuItem(child: Text('Settings')),
                ];
              },
            )
          ],
        ),
        body: TabBarView(
          children: [
            MyApi(),
            ChatsTab(),
            StatusTab(),
            CallTab(),
          ],
        ),
      ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            SingleChatWidget(
                chatTitle: "Bae",
                chatMessage: 'Ok good night',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg'),
            SingleChatWidget(
                chatTitle: "Mohsin Cacha uni",
                chatMessage: 'Apply kar',
                seenStatusColor: Colors.grey,
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU'),
            SingleChatWidget(
                chatTitle: "Fwb's",
                chatMessage: 'G',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://static3.srcdn.com/wordpress/wp-content/uploads/2017/06/Jaqen-Hghar-Game-of-Thrones.jpg'),
            SingleChatWidget(
                chatTitle: "Hamza Frnd",
                chatMessage: 'hello',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://i.insider.com/5ce420e193a15232821d3084?width=700'),
            SingleChatWidget(
                chatTitle: "Saeed Frnd",
                chatMessage: 'Sunao kia hal ha g',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700'),
            SingleChatWidget(
                chatTitle: "+92 3125416407",
                chatMessage: 'Sir is product k baray ma bta dain price....',
                seenStatusColor: Colors.grey,
                imageUrl:
                    'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg'),
            SingleChatWidget(
                chatTitle: "Udemy Free & Paid Courses",
                chatMessage:
                    '+91 79809 22234748 joined using this group/s\' invite link',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU'),
            SingleChatWidget(
                chatTitle: "Hassan Ikram Uni...",
                chatMessage: 'Hahaahah han ye b ha',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700'),
          ],
        ),
      ),
    );
  }
}

class SingleChatWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;
  final Color? seenStatusColor;
  final String? imageUrl;

  const SingleChatWidget({
    Key? key,
    this.chatMessage,
    this.chatTitle,
    this.seenStatusColor,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl!),
        ),
        Expanded(
          child: ListTile(
            title: Text('$chatTitle',
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Row(children: [
              Icon(
                seenStatusColor == Colors.blue ? Icons.done_all : Icons.done,
                size: 15,
                color: seenStatusColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    '$chatMessage',
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            ]),
            trailing: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Yesterday',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StatusTab extends StatelessWidget {
  const StatusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Color(0xff128C7E),
                      foregroundColor: Color(0xff128C7E),
                      radius: 30,
                      backgroundImage: AssetImage('lib/assets/images/Me.jpg'),
                    ),
                    Positioned(
                      top: 40,
                      left: 40,
                      child: CircleAvatar(
                        radius: 10,
                        child: Icon(Icons.add, size: 20),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: ListTile(
                    title: Text('My Status'),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Text('Tap to add status update'),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text('Recent updates',
                  style: TextStyle(fontWeight: FontWeight.w400)),
            ),
            Row(
              children: [
                Stack(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage:
                            AssetImage('lib/assets/images/Mountains.jpg'),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: ListTile(
                    title: Text('Arya Stark'),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Text('7 minutes ago'),
                    ),
                  ),
                ),
              ],
            ),
            // Since the ExpansionTile has top and bottom borders by default and we don't want that so we
            //use Theme to override its dividerColor property
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Viewed updates',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textWidthBasis: TextWidthBasis.longestLine,
                    ),
                  ),
                  SingleStatusItem(
                    statusTitle: 'Cersei Lannister',
                    statusTime: '56 minutes ago',
                    statusImage: 'lib/assets/images/Ansu.jpg',
                  ),
                  SingleStatusItem(
                    statusTitle: 'Lyanna Mormont',
                    statusTime: '2 minutes ago',
                    statusImage: 'lib/assets/images/Ubuntu.png',
                  ),
                  SingleStatusItem(
                    statusTitle: 'Daenerys Targaryen',
                    statusTime: '12 minutes ago',
                    statusImage: 'lib/assets/images/Mountains.jpg',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleStatusItem extends StatelessWidget {
  final String? statusTitle;
  final String? statusTime;
  final String? statusImage;
  const SingleStatusItem({
    Key? key,
    this.statusTitle,
    this.statusTime,
    this.statusImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('$statusImage'),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListTile(
            title: Text('$statusTitle'),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text("$statusTime"),
            ),
          ),
        ),
      ],
    );
  }
}

class CallTab extends StatelessWidget {
  const CallTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            SingleCallWidget(
              callStatus: 'Outgoing',
              callType: 'Audio',
              chatMessage: 'Today, 12:28 PM',
              chatTitle: 'Bae',
              imageUrl:
                  'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg',
            ),
            SingleCallWidget(
              callStatus: 'Incoming',
              callType: 'Video',
              chatMessage: 'Today, 01:11 AM',
              chatTitle: 'Fwb\'s',
              imageUrl:
                  'https://pyxis.nymag.com/v1/imgs/8a2/6a6/8ddcaf4454e34b72484c5393560af17366-09-cersei-lannister.rsquare.w700.jpg',
            ),
            SingleCallWidget(
              callStatus: 'Incoming',
              callType: 'Video',
              chatMessage: 'Today, 5:28 AM',
              chatTitle: 'Hamza Frnd',
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/en/8/80/Melisandre-Carice_van_Houten.jpg',
            ),
            SingleCallWidget(
              callStatus: 'Outgoing',
              callType: 'Audio',
              chatMessage: 'Today, 12:28 PM',
              chatTitle: 'Haseeb Dr',
              imageUrl: 'lib/assets/images/Mountains.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class SingleCallWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;
  final String? callStatus;
  final String? imageUrl;
  final String? callType;

  const SingleCallWidget({
    Key? key,
    this.chatMessage,
    this.chatTitle,
    this.callStatus,
    this.imageUrl,
    this.callType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl!),
        ),
        Expanded(
          child: ListTile(
              title: Text('$chatTitle',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Row(children: [
                Icon(
                  callStatus == 'Incoming'
                      ? (Icons.call_received_sharp)
                      : Icons.call_made_sharp,
                  size: 15,
                  color: callStatus == 'Incoming' ? Colors.teal : Colors.red,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      '$chatMessage',
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ]),
              trailing: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(
                        callType == 'Audio' ? Icons.call : Icons.videocam,
                        color: Colors.teal),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

class MyApi extends StatefulWidget {
  MyApi({Key? key}) : super(key: key);

  @override
  _MyApiState createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  Future<List<Joke>> getjokes() async {
    var data = await http
        .get(Uri.parse("https://api.chucknorris.io/jokes/search?query=cats"));

    var jsonData = json.decode(data.body);

    List<Joke> jokes = [];
    for (var joke in jsonData["result"]) {
      Joke newJoke = Joke(joke["created_at"], joke["icon_url"], joke["id"],
          joke["url"], joke["value"]);
      jokes.add(newJoke);
    }

    return jokes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: getjokes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int ind) {
                    return Container(
                      height: 280,
                      child: new Card(
                        child: new Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GridTile(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Image(
                                      image: NetworkImage(
                                          snapshot.data[ind].iconUrl),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  footer: GridTileBar(
                                    title: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            snapshot.data[ind].value,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              backgroundColor: Colors.black87,
                                              //height: 20
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}

class Joke {
  final String createdAt;
  final String iconUrl;
  final String id;
  final String url;
  final String value;

  Joke(this.createdAt, this.iconUrl, this.id, this.url, this.value);
}
