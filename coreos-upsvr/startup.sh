#!/bin/bash

if [ "${VERSION}" = "" ] || [ "${SERVER_ADDR}" = "" ]; then
    echo '[ERROR] Environment variable ${VERSION} or ${SERVER_ADDR} is empty !'
    exit -1
fi

URL="http://${SERVER_ADDR}" 
BASE="/coreos_updates/${VERSION}"

if [ ! -d ${BASE} ]; then
    mkdir -p ${BASE}
fi

if [ ! -f ${BASE}/update.gz ]; then
    wget -qP ${BASE} https://commondatastorage.googleapis.com/update-storage.core-os.net/amd64-usr/$VERSION/update.gz
fi

SIZE=$(stat -c %s ${BASE}/update.gz)
SHA1_b64=$(echo -n "$(echo -n $(sha1sum ${BASE}/update.gz | awk '{print $1}') | sed -e 's/../\\x&/g')" | base64 )
SHA256_b64=$(echo -ne "$(echo -n $(sha256sum ${BASE}/update.gz | awk '{print $1}') | sed -e 's/../\\x&/g')" | base64)

XML="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<response protocol=\"3.0\" server=\"update.core-os.net\">
 <daystart elapsed_seconds=\"0\"></daystart>
 <app appid=\"e96281a6-d1af-4bde-9a0a-97b76e56dc57\" status=\"ok\">
  <updatecheck status=\"ok\">
   <urls>
    <url codebase=\"${URL}/${VERSION}/\"></url>
   </urls>
   <manifest version=\"${VERSION}\">
    <packages>
     <package hash=\"${SHA1_b64}\" name=\"update.gz\" size=\"${SIZE}\" required=\"false\"></package>
    </packages>
    <actions>
     <action event=\"postinstall\" ChromeOSVersion=\"\" sha256=\"${SHA256_b64}\" needsadmin=\"false\" IsDelta=\"false\" DisablePayloadBackoff=\"true\"></action>
    </actions>
   </manifest>
  </updatecheck>
 </app>
</response>" 

echo "$XML" > ${BASE}/index.html

nginx -g "daemon off;"

