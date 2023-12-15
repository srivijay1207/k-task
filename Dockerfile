FROM almalinux:8
RUN yum install nginx -y
RUN echo "welcome to  nginx server" > /usr/share/nginx/html/vijay.html
CMD ["nginx", "-g", "daemon off;"]