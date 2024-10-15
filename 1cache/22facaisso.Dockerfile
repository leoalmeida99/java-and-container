# time podman build -t workdir?? -f Containerfile ../quarkus/target

# cada linha gera uma layer, cada layer tem seu cache,
# agrupar linhas e comandos que tenha o mesmo próposito, por exemplo:
#
# esses comandos sãoa repsonsaveis por deixar o ambiente preparado:
# RUN apt-get update
# RUN apt -y install default-jdk ssh vim

# então a boa prática é colocar eles no mesmo comando:
# RUN apt-get update && \
# apt -y install default-jdk ssh vim

# gerando uma unica layer, estou gerando apenas um cache, 
# deixando a gestão da imagem mais simples.

FROM debian/buildd:stable

RUN apt-get update && \
    apt -y install default-jdk ssh vim

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY java-e-container-1.0.0-SNAPSHOT.jar /deployment/

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]