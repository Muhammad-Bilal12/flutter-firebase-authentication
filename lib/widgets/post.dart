import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Post extends StatelessWidget {
  final Map data;
  const Post({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      width: 250,
      height: 250,
      child: Column(
        children: [
          Image.network(
            data["url"],
            fit: BoxFit.fitWidth,
          ),
          Text(data["title"]),
          Text(data["description"]),
        ],
      ),
    );
  }
}
