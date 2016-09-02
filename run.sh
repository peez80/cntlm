#!/bin/bash

cat << EOF > /cntlm.conf
Proxy       ${CNTLM_PROXY}

NoProxy     ${CNTLM_NO_PROXY}

Gateway     yes
Listen      0.0.0.0:3128

EOF

if [ ! -z "${CNTLM_USERNAME}" ]
then
echo "Username    ${CNTLM_USERNAME}" >> /cntlm.conf
fi

if [ ! -z "${CNTLM_DOMAIN}" ]
then
echo "Domain      ${CNTLM_DOMAIN}" >> /cntlm.conf
fi

if [ ! -z "${CNTLM_PASSWORD}" ]
then
echo "Password      ${CNTLM_PASSWORD}" >> /cntlm.conf
fi

if [ ! -z "${CNTLM_PASSNTLMV2}" ]
then
echo "PassNTLMv2      ${CNTLM_PASSNTLMV2}" >> /cntlm.conf
fi

if [ ! -z "${CNTLM_PASSNT}" ]
then
echo "PassNT      ${CNTLM_PASSNT}" >> /cntlm.conf
fi

if [ ! -z "${CNTLM_PASSLM}" ]
then
echo "PassLM      ${CNTLM_PASSLM}" >> /cntlm.conf
fi

cntlm -f -v -c /cntlm.conf $*


