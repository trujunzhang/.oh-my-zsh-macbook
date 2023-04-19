#!/bin/bash

CURRENT=`pwd`

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