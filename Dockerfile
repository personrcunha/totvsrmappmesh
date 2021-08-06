#https://tdn.totvs.com/display/framework/TOTVS+License+Server+Virtual
FROM quay.io/centos/centos:stream
RUN wget ftp://ftp.totvs.com.br/hlcloud/Instaladores/LicenseServerVirtual/x64/linux/installer.jar

RUN appserver -install
CMD [ "/sbin/init" ]
EXPOSE port

