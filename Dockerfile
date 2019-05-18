FROM alpine

LABEL maintainer="chakradhar jonagam"

ARG VCS_REF
ARG BUILD_DATE

ENV KUBEFED_VERSION="v0.0.10"

#RUN apk add --update ca-certificates \
RUN wget https://github.com/kubernetes-sigs/kubefed/releases/download/${KUBEFED_VERSION}/kubefedctl.tgz \
 && tar -zxvf kubefedctl.tgz \
 && chmod u+x kubefedctl \
 && mv kubefedctl /usr/local/bin/kubefedctl
# && rm /var/cache/apk/* 

WORKDIR /root/.kube
ENTRYPOINT ["kubefedctl"]
CMD ["help"]
