FROM alpine:3.15
RUN apk --no-cache add vsftpd; \
    mkdir -p /srv/ftp/pub; \
    chown nobody:nogroup /srv/ftp/pub; \
    adduser -g foo -D foo; \
    echo "foo:foo" | chpasswd; \
    mkdir -p /home/foo/ftp/files; \
    chown nobody:nogroup /home/foo/ftp; \
    chmod 555 /home/foo/ftp; \
    chown foo:foo /home/foo/ftp/files
COPY ./vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf
EXPOSE 21/tcp
EXPOSE 20/tcp
ENTRYPOINT /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
