
CURRENT=`pwd`

if [ ! -f "$CURRENT/bindings.dart" ]; then
    touch "$CURRENT/bindings.dart"
fi

if [ ! -f "$CURRENT/view.dart" ]; then
    touch "$CURRENT/view.dart"
fi

if [ ! -f "$CURRENT/state.dart" ]; then
    touch "$CURRENT/state.dart"
fi

if [ ! -f "$CURRENT/controller.dart" ]; then
    touch "$CURRENT/controller.dart"
fi

if [ ! -f "$CURRENT/index.dart" ]; then
    echo -e "library category; \n\nexport './bindings.dart'; \nexport './view.dart'; \nexport './state.dart'; \nexport './controller.dart'; \n" > "$CURRENT/index.dart"
fi

