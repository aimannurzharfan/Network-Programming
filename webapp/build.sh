#!/bin/bash

# refresh sysinfo
if [ -f ../scripts/sysinfo.sh ]; then
    bash ../scripts/sysinfo.sh > data/sysinfo.txt
fi

# refresh configs
if ls ../ansible/ios_configurations/*.txt 1> /dev/null 2>&1; then
    cp ../ansible/ios_configurations/*.txt data/configs/.
fi

# make workspace
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static
mkdir tempdir/data

cp app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.
cp -r data/* tempdir/data/.

# write dockerfile
echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY  ./data /home/myapp/data/" >> tempdir/Dockerfile
echo "COPY  app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 8080" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/app.py" >> tempdir/Dockerfile

# build and run
cd tempdir
docker build -t toolkitapp .
docker run -t -d -p 8080:8080 --name toolkitrunning toolkitapp
docker ps -a
