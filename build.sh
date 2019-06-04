# !bin/bash
run=true
pathToRun=''
param=''

if [ $3 == "-api" ]
then
    if [ $4 == 'local' ]
    then
        pathToRun='lib/main_local.dart'
    elif [ $4 == 'staging' ]
    then
        pathToRun='lib/main_staging.dart'
    elif [ $4 == 'production' ]
    then
        pathToRun='lib/main_prod.dart'
    else 
        echo "Invalid arguments, usage: ./build.sh -action build/run -api local/staging/production --debug/release"
    fi     
else
    echo "Invalid arguments, usage: ./build.sh -action build/run -api local/staging/production --debug/release"
fi

if [ $5 == '--debug' ]
then
    param=''
else [ $5 == '--release' ]
    param=$5
fi

if [ $2 == 'run' ]
then
    grep -q org.jimber.threebotlogin.debug android/app/build.gradle
    if [ $? == 0 && $param == '--release' ]
    then
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/build.gradle
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/google-services.json
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/src/debug/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/src/main/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/src/profile/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/src/main/java/org/jimber/threebotlogin/MainActivity.java
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' ios/Runner/Info.plist
    elif [ $? != 0 && $param == '' ]
    then
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/build.gradle
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/google-services.json
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/src/debug/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/src/main/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/src/profile/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/src/main/java/org/jimber/threebotlogin/MainActivity.java
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' ios/Runner/Info.plist
    fi

    echo flutter $2 -t $pathToRun $param
    flutter $2 -t $pathToRun $param
else
    grep -q org.jimber.threebotlogin.debug android/app/build.gradle
    if [ $? == 0 && $param == '--release' ]
    then
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/build.gradle
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/google-services.json
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/src/debug/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/src/main/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/src/profile/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' android/app/src/main/java/org/jimber/threebotlogin/MainActivity.java
        sed -i -e 's/org.jimber.threebotlogin.debug/org.jimber.threebotlogin/g' ios/Runner/Info.plist
    elif [ $? != 0 && $param == '' ]
    then
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/build.gradle
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/google-services.json
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/src/debug/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/src/main/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/src/profile/AndroidManifest.xml
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' android/app/src/main/java/org/jimber/threebotlogin/MainActivity.java
        sed -i -e 's/org.jimber.threebotlogin/org.jimber.threebotlogin.debug/g' ios/Runner/Info.plist
    fi

    echo flutter $2 apk -t $pathToRun $param
    flutter $2 apk -t $pathToRun $param
fi