# Prepare environment
#echo "Preparing environment"
if [ ! -d "src/build" ]; then
    mkdir src/build
    chmod u+wr src/build
fi
if [ ! -d "src/build/classes" ]; then
    mkdir src/build/classes
    chmod u+wr src/build
fi
if [ ! -d "src/package" ]; then
    mkdir src/package
    chmod u+wr src/build
fi

cp src/*.java src/package/

# Create class intermediates
#echo "Creating class intermediates"
javac -sourcepath src -d src/build/classes src/package/*.java

#echo "Executing from classes"
#java -classpath src/build/classes/ Program

#echo "Creating manifest"
echo Main-Class: Program>src/myManifest

#echo "Creating jar"
jar cfm src/build/ConnectM.jar src/myManifest -C src/build/classes/ .
cp src/build/ConnectM.jar ConnectM.jar

# Clean up intermediates
#echo "Cleaning Up"
rm src/build/classes/*
rm src/myManifest
rm src/package/*

# Start program
#echo "Starting program"
java -jar ConnectM.jar