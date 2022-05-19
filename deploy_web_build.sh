#!/bin/sh

flutter clean && flutter pub get
flutter build web

cd build/web
git add -A
git commit -m "Deploy web build"
git push origin main
