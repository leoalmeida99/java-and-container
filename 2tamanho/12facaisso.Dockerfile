# time podman build -t workdir?? -f Containerfile ../quarkus/target

# ter imagens de menor tamanho possível

# recursos alocados de um container são recursos compartilhados pelo host  
# (recursos finitos)
# por mais que o servidor disponibilize 1TB de disco
# não existe apenas 1 container rodando, pode haver milhares de containeres
# toda boa prática para ter o uso consciente: cpu, memoria, disco
# é interessante pq afeta todo o ecossistema compartilhado

# remover o SSH e VIM
# se precisar debuggar um container, entre nele e instale, resolva o problema
# e tire a ferramenta. Não deixar ferramentas que não use disponíveis 
# caso precise.

# reduz o tamanho da imagem, e também diminui a superficie de ataque
# quanto menos coisas temos na aplicação, diminui a superficie de ataque
# tendo menos coisas, temos menos coisas que possa ter alguma vunerabilidade

# remover o cache do gerenciador de pacotes
# no debian o gerenciador de pacotes é o apt
# o cache do apt fica na pasta rm -rf /var/lib/apt/lists/*


FROM debian/buildd:stable

RUN apt-get update && \
    apt -y install --no-install-recommends default-jdk && \
    rm -rf /var/lib/apt/lists/*

COPY quarkus-app/lib/boot/* /deployment/lib/
COPY quarkus-app/lib/main/* /deployment/lib/

COPY java-e-container-1.0.0-SNAPSHOT.jar /deployment/

CMD ["java" , "-jar", "/deployment/java-e-container-1.0.0-SNAPSHOT.jar"]