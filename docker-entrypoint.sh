#!/bin/sh

if [ -n "$ICECAST_SOURCE_PASSWORD" ]; then
    sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$ICECAST_SOURCE_PASSWORD<\/source-password>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_RELAY_PASSWORD" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$ICECAST_RELAY_PASSWORD<\/relay-password>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_ADMIN_PASSWORD" ]; then
    sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$ICECAST_ADMIN_PASSWORD<\/admin-password>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_ADMIN_USERNAME" ]; then
    sed -i "s/<admin-user>[^<]*<\/admin-user>/<admin-user>$ICECAST_ADMIN_USERNAME<\/admin-user>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_ADMIN_EMAIL" ]; then
    sed -i "s/<admin>[^<]*<\/admin>/<admin>$ICECAST_ADMIN_EMAIL<\/admin>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_LOCATION" ]; then
    sed -i "s/<location>[^<]*<\/location>/<location>$ICECAST_LOCATION<\/location>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_HOSTNAME" ]; then
    sed -i "s/<hostname>[^<]*<\/hostname>/<hostname>$ICECAST_HOSTNAME<\/hostname>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_MAX_CLIENTS" ]; then
    sed -i "s/<clients>[^<]*<\/clients>/<clients>$ICECAST_MAX_CLIENTS<\/clients>/g" /etc/icecast.xml
fi
if [ -n "$ICECAST_MAX_SOURCES" ]; then
    sed -i "s/<sources>[^<]*<\/sources>/<sources>$ICECAST_MAX_SOURCES<\/sources>/g" /etc/icecast.xml
fi
if [ -n "$SHOUTCAST_MOUNT" ]; then
    sed -i "s/<shoutcast-mount>[^<]*<\/shoutcast-mount>/<shoutcast-mount>$SHOUTCAST_MOUNT<\/shoutcast-mount>/g" /etc/icecast.xml
fi

sed -i \
    's#<header type="cors" name="Access-Control-Allow-Headers" />#<header name="Access-Control-Allow-Headers" value="Origin, Accept, X-Requested-With, Content-Type, If-Modified-Since, icy-metadata" />#' \
    /etc/icecast.xml
sed -i \
    's#<header type="cors" name="Access-Control-Allow-Origin" />#<header name="Access-Control-Allow-Origin" value="*" />#' \
    /etc/icecast.xml
sed -i \
    's#<header type="cors" name="Access-Control-Allow-Methods" />#<header name="Access-Control-Allow-Methods" value="GET, OPTIONS, HEAD" />#' \
    /etc/icecast.xml
sed -i \
    's#<header type="cors" name="Access-Control-Expose-Headers" />#<header name="Access-Control-Expose-Headers" value="Icy-MetaInt, Icy-Br, Icy-Description, Icy-Genre, Icy-Name, Ice-Audio-Info, Icy-Url, Icy-Sr, Icy-Vbr, Icy-Pub" />#' \
    /etc/icecast.xml

exec "$@"
