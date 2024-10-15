# time podman build -t workdir?? -f Containerfile ../quarkus/target

# o pilar principal da manutenção é sempre utilizar imagens oficiais
# inves de usar debian e instalar o jdk, use a imagem ofocial do openjdk

FROM openjdk

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY java-e-container-1.0.0-SNAPSHOT.jar /deployment/

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]