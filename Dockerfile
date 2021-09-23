FROM golang:1.13-alpine3.10 AS builder

WORKDIR /go/src
RUN mkdir -p /go/src/helloworld
ADD ./ /go/src/helloworld
RUN go build -o /go/bin/helloworld /go/src/helloworld/main.go


#FROM golang:1.13-alpine
FROM alpine:3.10

# Set the Current Working Directory inside the container
WORKDIR /home/

# Copy the source from the current directory to the Working Directory inside the container
COPY --from=builder /go/bin/helloworld /home/

# Command to run the executable
CMD ["/home/helloworld"]