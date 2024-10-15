# time podman build -t workdir?? -f Containerfile ../quarkus/target

# podendo haver mudança de sistema operacional
# no debian quando existe um install, automaticamente 
# instala dependencias recomendadas 

# esse -y significa YES, o famoso next next next na instalação do debian,
# então adicionar:
# RUN apt-get update && \
# apt -y install --no-install-recommends default-jdk ssh vim


FROM debian/buildd:stable

RUN apt-get update && \
    apt -y install --no-install-recommends default-jdk ssh vim

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY java-e-container-1.0.0-SNAPSHOT.jar /deployment/

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]