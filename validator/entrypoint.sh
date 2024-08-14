#!/bin/sh

# Handle Graffiti Character Limit
oLang=$LANG oLcAll=$LC_ALL
LANG=C LC_ALL=C
graffitiString=$(echo "$GRAFFITI" | cut -c 1-32)
LANG=$oLang LC_ALL=$oLcAll

exec node /usr/app/node_modules/.bin/lodestar \
    validator \
    --network=gnosis \
    --suggestedFeeRecipient="${FEE_RECIPIENT_ADDRESS}" \
    --graffiti="${graffitiString}" \
    --dataDir=/var/lib/data \
    --keymanager true \
    --keymanager.authEnabled true \
    --keymanager.port 3500 \
    --keymanager.address 0.0.0.0 \
    --metrics \
    --metrics.port 5064 \
    --metrics.address 0.0.0.0 \
    --externalSigner.url="${HTTP_WEB3SIGNER}" \
    --doppelgangerProtection="${DOPPELGANGER_PROTECTION}" \
    --beaconNodes="${BEACON_NODE_ADDR}" \
    --http.requestWireFormat=ssz \
    --logLevel="${DEBUG_LEVEL}" \
    --logFileLevel=debug \
    --logFileDailyRotate 5 \
    --logFile /var/lib/data/validator.log \
    "${EXTRA_OPTS}"
