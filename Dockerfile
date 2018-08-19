FROM golang:1 as build

ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOROOT_FINAL=/ 
RUN go get github.com/magefile/mage
RUN go get -d github.com/gohugoio/hugo
WORKDIR ${GOPATH:-$HOME/go}/src/github.com/gohugoio/hugo
RUN mage vendor
RUN mage install


FROM alpine

COPY --from=build /go/bin/hugo /bin/hugo
RUN mkdir /site
WORKDIR /site

ENTRYPOINT [ "/bin/hugo" ]
