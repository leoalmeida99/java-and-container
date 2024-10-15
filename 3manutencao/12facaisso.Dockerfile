# time podman build -t workdir?? -f Containerfile ../quarkus/target

# evitar utilizar a ultima versão
# devemos sempre utilizar a versão em que a aplicação foi testada
# é importante sempre utilizar a tag especifica da imagem que vamos utilizar
# nesse casi vamos utilizar o openjdk:21

FROM openjdk:21

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY java-e-container-1.0.0-SNAPSHOT.jar /deployment/

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]