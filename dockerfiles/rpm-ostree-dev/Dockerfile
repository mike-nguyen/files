FROM registry.fedoraproject.org/fedora:27
LABEL maintainer="Michael Nguyen <mnguyen@redhat.com>"
ENV container=docker
RUN dnf -y install dnf-plugins-core gcc-g++ git man && \
    dnf -y build-dep ostree rpm-ostree && \
    dnf -y clean all

RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "Defaults secure_path = /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >> /etc/sudoers && \
    useradd --groups wheel --uid 1000 mnguyen

USER mnguyen
CMD ["/bin/bash"]

