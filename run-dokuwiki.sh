docker run -d --name dokuwiki \
           -p 9408:80 \
           -e DOKUWIKI_USERNAME=admin \
           -e DOKUWIKI_FULL_NAME="Bruno Cardoso Cantisano" \
           -e DOKUWIKI_PASSWORD=admin \
           -e DOKUWIKI_EMAIL=**bruno.cantisano@gmail.com** \
           -e DOKUWIKI_WIKI_NAME="Dev Cantisano" \
           --volume /home/docker/arquivos/dokuwiki:/bitnami \
           bitnami/dokuwiki:latest