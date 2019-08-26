FROM node:9 as builder

COPY 3botlogin_frontend /3botlogin_frontend
WORKDIR /3botlogin_frontend
RUN npm i && npm run build


FROM nginx

RUN apt update && apt install -y python3 python3-pip 
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY --from=builder /3botlogin_frontend/dist /usr/share/nginx/frontend
COPY 3botlogin_backend/ /usr/share/nginx/backend

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY services.sh /services.sh
RUN chmod +x /services.sh
WORKDIR /usr/share/nginx/backend/

CMD /./services.sh
