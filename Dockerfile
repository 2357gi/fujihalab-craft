# openjdkだともしかするとところどころうまくいかないかも 要検証
FROM openjdk:13-ea-19-jdk-alpine3.9

WORKDIR /opt/app

RUN apk add --no-cache --update curl \
    && curl -LO https://launcher.mojang.com/v1/objects/808be3869e2ca6b62378f9f4b33c946621620019/server.jar \
	&& echo "eula=true" > eula.txt

EXPOSE 25565

CMD ["java","-Xmx1024M","-Xms1024M","-jar","server.jar","nogui"]

