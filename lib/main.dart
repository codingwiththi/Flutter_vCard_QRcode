import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr/qr.dart';
import 'package:vcard/vcard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'vCard QR Code'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var vCard = VCard();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///Set properties
    vCard.firstName = 'Thiago';
    vCard.middleName = 'Moreira';
    vCard.lastName = 'Ribeiro';
    vCard.organization = 'Nexa Tecnologia e Outsourcing';
    //vCard.photo.attachFromUrl('/path/to/image/file.png', 'PNG');
    vCard.workPhone = '27999999998';
    vCard.birthday = DateTime.utc(1995, 11, 1);
    vCard.title = 'Estagiário';
    vCard.url = 'https://github.com/thiagomr8';
    vCard.note = 'Estuda no Ifes';

    /// Save to file
    vCard.saveToFile('./contact.vcf');

    /// Get as formatted string
    print(vCard.getFormattedString());
    print(vCard.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text(vCard.getFormattedString()),
            QrImage(
              data: vCard.getFormattedString(),
              version: QrVersions.auto,
              size: 250,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
