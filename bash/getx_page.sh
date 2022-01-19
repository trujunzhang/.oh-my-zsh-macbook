#!/bin/bash

CURRENT=`pwd`

CLASSNAME=$1
PACKAGENAME=$2

if [ ! -d "$CURRENT/components" ]; then
    mkdir "$CURRENT/components"
    touch "$CURRENT/components/index.dart"
fi

if [ ! -d "$CURRENT/widgets" ]; then
    mkdir "$CURRENT/widgets"
    touch "$CURRENT/widgets/index.dart"
fi

if [ ! -f "$CURRENT/styles.dart" ]; then
    stylesFile="$CURRENT/styles.dart"
    cat > "$stylesFile" <<EOF
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

// const title = Variant('title');
// 
// Mix get overlay {
//   return Mix(
//     margin(8),
//     title(
//       titleCase(),
//     ),
//   );
// }

EOF

fi

if [ ! -f "$CURRENT/bindings.dart" ]; then
    bindingsFile="$CURRENT/bindings.dart"

    cat > "$bindingsFile" <<EOF
import 'package:get/get.dart';

import 'controller.dart';

class ${CLASSNAME}Binding implements Bindings {
  @override
  void dependencies() {
    Get.put<${CLASSNAME}Controller>(${CLASSNAME}Controller());
  }
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

class ${CLASSNAME}Page extends GetWidget<${CLASSNAME}Controller> {
  const ${CLASSNAME}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: MyAppBar(
          centerTitle: true,
          // title: MyTitle(S.of(context).drawerMenuItemAbout),
          leadingType: AppBarBackType.None,
        ),
        // body: Obx(() => _buildBody(context)));
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Container(color: Colors.red,);
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

import '../../../routes/params_helper.dart';

import 'state.dart';

class ${CLASSNAME}Controller extends GetxController {

  late String? detailId;

  final state = ${CLASSNAME}State();

  @override
  void onInit() {
    detailId = Get.parameters[ParamsHelper.ID];
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

//    GetPage(
//      name: Routes.INITIAL,
//      page: () => const ${CLASSNAME}Page(),
//      binding: ${CLASSNAME}Binding(),
//    ),

export './bindings.dart'; 
export './view.dart'; 
export './state.dart'; 
export './controller.dart'; 
EOF
fi

