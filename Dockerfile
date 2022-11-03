# If your version of node is different, this will be different
FROM node:17

# Working dir, you can put whatever you like.
# so all commands you run will assume that as the working directory
WORKDIR /usr/src/app

# Copy files from Build /// why do we do this?
COPY package*.json ./

# Install Globals
RUN npm install prettier -g

# Install Files
RUN npm install 

# Copy SRC /// why do we have two dots here?
COPY . .

# Build /// remember the static website example?
RUN npm run build

# Open Port 
EXPOSE 1337

# Docker Command to Start Service
CMD [ "node", "build/server.js" ]

### Why are we doing all this? Think back to what your computer does when it runs something locally...