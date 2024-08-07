FROM eclipse-temurin:11.0.24_8-jre-noble
RUN apt-get update && apt-get install wget ca-certificates -y

WORKDIR /opt

# downloading latest version of PowerTunnel
RUN curl -s https://api.github.com/repos/krlvm/PowerTunnel/releases/latest | grep "browser_download_url.*.jar" | cut -d : -f 2,3 | tr -d \" | xargs -I {} curl -L {} -o PowerTunnel.jar

VOLUME /config

# Link all config
COPY entry.sh /usr/local/bin/entry.sh

CMD [ "entry.sh" ]
