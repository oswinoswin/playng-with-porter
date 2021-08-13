FROM debian:stretch

ARG BUNDLE_DIR

RUN apt-get update && apt-get install -y ca-certificates s3cmd
RUN apt-get update && apt-get install -y apt-transport-https curl && \
    curl -o kubectl https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin && \
    chmod a+x /usr/local/bin/kubectl
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v1.43.0/doctl-1.43.0-linux-amd64.tar.gz  | tar xz
RUN mv ./doctl /usr/local/bin/ && \
    chmod a+x /usr/local/bin/doctl
   
# This is a template Dockerfile for the bundle's invocation image
# You can customize it to use different base images, install tools and copy configuration files.
#
# Porter will use it as a template and append lines to it for the mixins
# and to set the CMD appropriately for the CNAB specification.
#
# Add the following line to porter.yaml to instruct Porter to use this template
# dockerfile: Dockerfile.tmpl

COPY .cnab /cnab

# Use the BUNDLE_DIR build argument to copy files into the bundle
COPY . $BUNDLE_DIR
# exec mixin has no buildtime dependencies

RUN apt-get update && \
apt-get install -y apt-transport-https curl && \
curl -o kubectl https://storage.googleapis.com/kubernetes-release/release/v1.15.5/bin/linux/amd64/kubectl && \
mv kubectl /usr/local/bin && \
chmod a+x /usr/local/bin/kubectl

RUN rm $BUNDLE_DIR/porter.yaml
RUN rm -fr $BUNDLE_DIR/.cnab
COPY .cnab /cnab
WORKDIR $BUNDLE_DIR
CMD ["/cnab/app/run"]