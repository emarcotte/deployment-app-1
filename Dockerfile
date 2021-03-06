FROM docker.io/library/node:14

WORKDIR /app

COPY "index.js" "package.json" "package-lock.json" /app/
COPY --from=doitintl/secrets-init:v0.2.11 /usr/local/bin/secrets-init /usr/local/bin/secrets-init

RUN npm install

CMD secrets-init --provider google node index.js
