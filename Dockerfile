FROM openjdk:8u212-jre-alpine3.9

RUN apk add curl jq

#Create workspace. We do not want to start from root directory
WORKDIR usr/share/udemy

#Add the jar files
ADD target/selenium-docker.jar 			selenium-docker.jar
ADD target/selenium-docker-tests.jar    selenium-docker-tests.jar
ADD target/libs							libs
#This will copy target/libs to udemy. (It will create the libs directory in udemy folder)
#This will add both the jar files to udemy folder

#Add the suite files
ADD book-flight-module.xml 				book-flight-module.xml
ADD search-module.xml					search-module.xml

#Add health check script
ADD healthcheck1.sh 						healthcheck1.sh

#   Parameters
#	- BROWSER
#   - HUB_HOST
#   - MODULE_XML
#This means whoever will create the container from this image, will have to pass these 3 variables

ENTRYPOINT sh healthcheck1.sh