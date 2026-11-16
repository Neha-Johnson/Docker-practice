FROM node:20-alpine AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production

FROM node:20-alpine AS runner
WORKDIR /usr/src/app
COPY --from=builder --chown=node:node /usr/src/app/node_modules ./node_modules
COPY --chown=node:node server.js ./server.js
COPY --chown=node:node package.json ./package.json
USER node
EXPOSE 3000
CMD ["node", "server.js"]

