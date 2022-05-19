#!/bin/sh

flutter clean && flutter pub get
flutter build web

cd build/web
git init
git remote add origin https://github.com/JoaoReisA/JoaoReisA.github.io.git
git add .
git branch -M main
git commit -m "Deploy web build"
git pull origin main --rebase
git add .
git rebase --continue
git push origin main