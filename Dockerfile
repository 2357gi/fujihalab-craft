FROM openjdk:13-ea-19-jdk-alpine3.9

WORKDIR /opt/app

RUN apk add --no-cache --update curl

# 
# url的に ENV MINECRAFT_VERSION='x.x.x' ができない. 
# 他のバージョン使いたかったら
# https://mcversions.net/

RUN curl -LO https://launcher.mojang.com/v1/objects/808be3869e2ca6b62378f9f4b33c946621620019/server.jar \
	&& echo "eula=true" > eula.txt

# RUN addgroup -g 1000 minecraft &&\
#     adduser -u 1000 -H -D -G minecraft minecraft &&\
# 	chown -R minecraft:minecraft /opt/app/server.jar
# 
# USER minecraft

EXPOSE 25565

CMD ["java","-Xmx1024M","-Xms1024M","-jar","server.jar","nogui"]

