FROM alpine:3.17

ARG FTP_USR \
    FTP_PWD

RUN apk update && apk upgrade && \
    apk add --no-cache vsftpd

RUN mkdir -p /var/www/wordpress && \
    adduser -h /var/www/wordpress -s /bin/false -D ${FTP_USR} && \
    echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd && \
    chown -R ${FTP_USR}:${FTP_USR} /var/www/wordpress && \
    echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

RUN sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd/vsftpd.conf && \
    sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
    sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
    sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd/vsftpd.conf

RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
    echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf && \
    echo 'local_root=/var/www/wordpress' >> /etc/vsftpd/vsftpd.conf && \
    echo 'listen_address=0.0.0.0' >> /etc/vsftpd/vsftpd.conf && \
    echo "userlist_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd/vsftpd.conf && \
    echo "userlist_deny=NO" >> /etc/vsftpd/vsftpd.conf


EXPOSE 21

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]