FROM node:18-alpine

RUN npm install -g pm2

WORKDIR /src

COPY . .

RUN npm run setup

EXPOSE 3000

CMD ["npm", "run", "start"]
