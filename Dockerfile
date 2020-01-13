# Set up the CC7 CMSSW base:
FROM cmssw/cc7


LABEL maintainer="Peter Fackeldey <peter.fackeldey@cern.ch>"

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="CC7 CMS base OS" \
        org.label-schema.description="CC7 OS capable of using/running CMS software release(s)." \
        org.label-schema.url="http://cms-sw.github.io/" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-schema.vendor="CERN" \
        org.label-schema.version=$VERSION \
        org.label-schema.schema-version="1.0"

RUN     yum update -y && \
        yum install -y \
            htop python-devel python36 python36-pip xz-devel \
            vim-X11 vim-common vim-enhanced vim-minimal virtualenv \
            redhat-lsb-core screen \
        yum clean all

RUN     pip install --no-cache-dir virtualenv
