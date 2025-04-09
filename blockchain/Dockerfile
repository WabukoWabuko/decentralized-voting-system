FROM node:16

WORKDIR /app

RUN npm install -g truffle
COPY package.json .
RUN npm install

COPY . .

CMD ["truffle", "version"]
