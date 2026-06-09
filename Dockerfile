FROM node:18-alpine

ENV NODE_OPTIONS=--openssl-legacy-provider
ENV HOST=0.0.0.0
ENV PORT=3000

RUN npm install -g pm2

WORKDIR /src

COPY . .

RUN npm run setup

RUN npm install @babel/runtime
RUN cd backend && npm install @babel/runtime
RUN cd frontend && npm install @babel/runtime

RUN cd frontend && npm run build

EXPOSE 3000

CMD ["sh", "-c", "cd backend && npm run start"]
