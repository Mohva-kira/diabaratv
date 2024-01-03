# RUN
FROM node:18-alpine AS build

ARG envType=staging

RUN echo ${envType}

RUN mkdir /app

WORKDIR /app

COPY . .
RUN npm install
EXPOSE 3000

CMD ["npm", "run", "dev"]




