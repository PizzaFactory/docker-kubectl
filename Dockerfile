FROM alpine as downloader

ARG VERSION=v1.17.0
WORKDIR /
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl
RUN chmod 755 kubectl

FROM scratch

COPY --from=downloader /kubectl /kubectl

ENTRYPOINT [ "/kubectl" ]
CMD [ "proxy", "--port=8080" ]
