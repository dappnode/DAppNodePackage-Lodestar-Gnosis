#!/bin/sh

exec node /usr/app/node_modules/.bin/lodestar \
    validator \
    --network=mainnet \
    --suggestedFeeRecipient=${FEE_RECIPIENT_ADDRESS} \
    --graffiti=${GRAFFITI:0:32} \
    --keymanager true \
    --keymanager.authEnabled false \
    --keymanager.port 3500 \
    --keymanager.address 0.0.0.0 \
    --externalSigner.url=${HTTP_WEB3SIGNER} \
    --doppelgangerProtectionEnabled \
    --server=${BEACON_NODE_ADDR} \
    --logLevel=${DEBUG_LEVEL} \
    --logFileLevel=${DEBUG_LEVEL} \
    --logFile /var/lib/data/validator.log \
    $EXTRA_OPTS
