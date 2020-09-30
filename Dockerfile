FROM node
COPY ./ /app
WORKDIR /app
RUN yarn config set registry https://registry.npm.taobao.org/ \
 && yarn config set sass_binary_site https://npm.taobao.org/mirrors/node-sass/ -g \
 && yarn && yarn build

FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf