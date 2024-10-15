# time podman build -t workdir?? -f Containerfile ../quarkus/target/quarkus-app

FROM debian/buildd:stable

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY *-run.jar /deployment/

RUN apt-get update
RUN apt -y install default-jdk ssh vim

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]