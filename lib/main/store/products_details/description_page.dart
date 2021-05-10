import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1 * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 21.5,
            ),
          ],
        ),
      ),
    );
  }
}