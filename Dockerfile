FROM docker.io/library/node:14

WORKDIR /app

COPY "index.js" "package.json" "package-lock.json" /app/

RUN npm install

CMD node index.js
