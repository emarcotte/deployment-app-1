FROM docker.io/library/node:14

WORKDIR /app

COPY "index.js" "package.json" "package-lock.json" /app/
COPY --from=doitintl/secrets-init:v0.2.11 /usr/local/bin/secrets-init /usr/local/bin/secrets-init

RUN npm install

ENV HELLO=gcp:secretmanager:projects/879760730093/secrets/my-database-password

CMD secrets-init --provider google node index.js
