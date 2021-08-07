import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart';

import 'header.dart';

class View extends StatelessWidget {
  static const String markdownSource = """
  # Tip 2 : `If Null` Operator (`??`)

## by @erluxman

`??` checks If something is `null`. If it's not null it returns its own value but if it's `null` it returns the value after `??`

`return abc??10; //returns 10 if abc is null else returns its own value,`

It also has shorthand assignment when it's null.

`abc??=5 //assigns 5 to abc if it's null`

```dart
testOldMethod() {
  print("NullChecking in old way");
  var abc;

  if (abc == null) {
    print("It's null");
  } else {
    print(abc);
  }

  if (abc == null) {
    abc = 5;
  }
}

testIfNullOperator() {
  print("NullChecking with if Null Operator");
  var abc;

  print(abc ?? "It's null");
  abc ??= 5;
  print(abc ?? "It's null");
}
```

Output:

```
NullChecking in old way
It's null
5
--------------------
NullChecking with if Null Operator
It's null
5
```
""";
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_forward_rounded, color: Colors.white),
      ),
      body: Column(
        children: [
          Header(),
          Expanded(
            child: Markdown(
              selectable: true,
              data: markdownSource,
              extensionSet: ExtensionSet(
                  ExtensionSet.gitHubFlavored.blockSyntaxes,
                  [...ExtensionSet.gitHubFlavored.inlineSyntaxes]),
            ),
          )
        ],
      ),
    );
  }
}
