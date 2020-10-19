import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../format_json.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class StateButton extends StatelessWidget {
  const StateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () async {
          var response = await http.post('http://192.168.1.1/osc/state');
          var responseBody = formatJson(response.body.toString());

          context
            .read<MainResponseWindow>()
            .updateResponseWindow(responseBody);

          print(responseBody);
        },
        child: Text('State'),
        color: Colors.teal[200],
      ),
    );
  }
}
