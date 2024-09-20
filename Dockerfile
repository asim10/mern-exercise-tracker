FROM node:20-alpine

RUN mkdir -p /home/app

COPY . /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app/backend

# will execute npm install in /home/app/backend because of WORKDIR
RUN npm install
RUN npm install -g nodemon

WORKDIR /home/app

RUN npm install

# Build the frontend
RUN npm run build

EXPOSE 3000


CMD ["sh", "-c", "cd /home/app/backend && node server.js & cd /home/app && npm start"]
