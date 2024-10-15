# time podman build -t workdir?? -f Containerfile ../quarkus/target

FROM debian/buildd:stable

RUN apt-get update
RUN apt -y install default-jdk ssh vim

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY java-e-container-1.0.0-SNAPSHOT.jar /deployment/

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]