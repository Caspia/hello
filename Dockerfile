FROM node:10.9-alpine

ARG HELLO_PORT=3000
ENV HELLO_PORT $HELLO_PORT
# utilities helpful in development
# RUN apk add --no-cache nano curl 
# create app directory
RUN mkdir -p /home/node/app
WORKDIR /home/node/app

# Bundle the app source
ENV NODE_ENV production
COPY . /home/node/app
#RUN chmod 755 bin/*
RUN chown node:node -R .
USER node
RUN npm install

EXPOSE $HELLO_PORT

ENTRYPOINT ["node", "app.js"]
