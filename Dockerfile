# Quick and easy way to get a homey pet container.
FROM registry.fedoraproject.org/fedora:28
MAINTAINER Michael Nguyen <mnguyen@redhat.com>

COPY . /files

# we install in /usr/local
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    useradd --groups wheel --uid 1000 mnguyen && \
    chown -R mnguyen:mnguyen /files

USER mnguyen

RUN cd /files && source utils/setup

CMD ["/bin/bash"]

LABEL RUN="/usr/bin/docker run -ti --rm --privileged \
            -v /:/host --workdir \"/host/\$PWD\" \${OPT1} \
            \${IMAGE}"
