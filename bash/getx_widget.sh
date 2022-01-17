#!/bin/bash

CURRENT=`pwd`

CLASSNAME=$1
PACKAGENAME=$2

if [ ! -d "$CURRENT/widgets" ]; then
    mkdir "$CURRENT/widgets"
    touch "$CURRENT/widgets/index.dart"
fi

if [ ! -f "$CURRENT/styles.dart" ]; then
    stylesFile="$CURRENT/styles.dart"
    cat > "$stylesFile" <<EOF
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

const title = Variant('title');

Mix get overlay {
  return Mix(
    margin(8),
    title(
      titleCase(),
    ),
  );
}

EOF

fi

if [ ! -f "$CURRENT/view.dart" ]; then
    viewFile="$CURRENT/view.dart"
    cat > "$viewFile" <<EOF
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';

import 'styles.dart';
import 'index.dart';

class ${CLASSNAME} extends StatefulWidget {
  const ${CLASSNAME}({Key? key}) : super(key: key);

  @override
  _${CLASSNAME}State createState() => _${CLASSNAME}State();
}

class _${CLASSNAME}State extends State<${CLASSNAME}> {
  ${CLASSNAME}Controller controller = Get.put<${CLASSNAME}Controller>(${CLASSNAME}Controller());

  @override
  void initState() {
    // controller.loadMovieInfo(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Obx(() => _buildBody(context));
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(color: Colors.red,);
  }

  @override
  void dispose() {
    Get.delete<${CLASSNAME}Controller>();
    super.dispose();
  }
}

EOF

fi

if [ ! -f "$CURRENT/state.dart" ]; then
    stateFile="$CURRENT/state.dart"
    cat > "$stateFile" <<EOF
import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';

class ${CLASSNAME}State {
  Rx<String> displayName = Rx<String>('');

}
EOF
fi

if [ ! -f "$CURRENT/controller.dart" ]; then
    controllerFile="$CURRENT/controller.dart"
    cat > "$controllerFile" <<EOF
import 'package:get/get.dart';
import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';

import 'state.dart';

class ${CLASSNAME}Controller extends GetxController {
  PageController pageController = Get.find();

  final state = ${CLASSNAME}State();

  @override
  void onInit() {
    super.onInit();
  }

//==========================================================
// UI Events
//==========================================================
  onIconPress() {}

}
EOF
fi

if [ ! -f "$CURRENT/index.dart" ]; then
    indexFile="$CURRENT/index.dart"
    cat > "$indexFile" <<EOF
library ${PACKAGENAME};

export './view.dart'; 
export './state.dart'; 
export './controller.dart'; 
EOF
fi

