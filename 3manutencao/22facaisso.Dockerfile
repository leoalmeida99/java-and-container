# time podman build -t workdir?? -f Containerfile ../quarkus/target

# sempre quando for usar imagem base de alguma tecnologia
# sempre comece a sua imagem, com a menor imagem possível.
# se precisar de algum recurso depois, procure outra imagem

# no openjdk, está deprecated, ou seja, outros players estão mantendo
# a imagem openjdk, o eclipse temurim disponibiliza uma imagem pequena

FROM eclipse-temurin:21-jre-alpine

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY java-e-container-1.0.0-SNAPSHOT.jar /deployment/

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]