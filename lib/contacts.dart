import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:splashtest/components/splash/splashapi.dart';
import 'package:flutter_svg/svg.dart';
import 'components/callAPI/callAPI.dart';

class ContactsPage extends StatefulWidget {
  @override
  _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
}

class _FlutterContactsExampleState extends State<ContactsPage> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  late Future<SplashAPI> _future;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission()) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() => _contacts = contacts);
    }
    _future = getImage(_contacts!.length);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Contacts'),
            flexibleSpace: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
          ),
          body: _body(),
        ),
      );

  Widget _body() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return FutureBuilder<SplashAPI>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: _contacts!.length,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  tileColor: snapshot.data!.data.images[i].pirate == true
                      ? Colors.red
                      : Colors.white,
                  leading: CircleAvatar(
                    backgroundColor:
                        snapshot.data!.data.images[i].pirate == true
                            ? Colors.red
                            : Colors.white,
                    child:
                        SvgPicture.network(snapshot.data!.data.images[i].url),
                  ),
                  title: Text(_contacts![i].displayName),
                  subtitle: Text(_contacts![i].phones.isNotEmpty
                      ? _contacts![i].phones.first.number
                      : '(none)'),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
