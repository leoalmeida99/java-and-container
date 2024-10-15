# time podman build -t workdir?? -f Containerfile ../quarkus/target

# para evitar problemas de segurança e cache, pegue em especifico o arquivo desejado,
# ou seja, é uma má prática pegar todos os run's do projeto "*-run.jar"
# pegue o arquivo em especifico por exemplo:
# COPY java-e-container-1.0.0-SNAPSHOT.jar

FROM debian/buildd:stable

RUN apt-get update
RUN apt -y install default-jdk ssh vim

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY java-e-container-1.0.0-SNAPSHOT.jar /deployment/

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]