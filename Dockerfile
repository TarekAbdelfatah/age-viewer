FROM node:18-alpine

RUN npm install -g pm2

WORKDIR /src

COPY . .

RUN npm run setup

RUN cd backend && npm install @babel/runtime

EXPOSE 3000

CMD ["npm", "run", "start"]
