#!/bin/sh

if [ $# -lt 1 ]
then
  echo "Usage: `basename $0` macosx/linx/windows [run]"
  exit 1
fi

echo "Building for $1.."

gradlew build

rm -r dist
mkdir dist
cp build/libs/Cyborg-Hippos.jar dist/Cyborg-Hippos.jar
cp -r res dist/res
cp -r lib/native/$1/* dist/
cp gamesettings.settings dist

if [[ $2 = "run" ]]
then
  echo Starting the game..
  cd dist
  java -jar Cyborg-Hippos.jar
fi
