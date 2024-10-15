# time podman build -t workdir?? -f Containerfile ../quarkus/target/quarkus-app

# deixe sempre em primeiro quem dificilmente vai mudar.

# deixe sempre por ultimo o que muda sempre, por exemplo:
# - bibliotecas que vao utilizar no projeto
# - executaveis que vão ser gerados

# dessa maneira utilizamos da melhor forma o cache

FROM debian/buildd:stable

RUN apt-get update
RUN apt -y install default-jdk ssh vim

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY *-run.jar /deployment/

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]