#!/bin/sh

# Concatenate EXTRA_OPTS string
[ -n "$CHECKPOINT_SYNC_URL" ] && EXTRA_OPTS="${EXTRA_OPTS} --checkpointSyncUrl=${CHECKPOINT_SYNC_URL}"

case $_DAPPNODE_GLOBAL_EXECUTION_CLIENT_GNOSIS in
"nethermind-xdai.dnp.dappnode.eth")
  HTTP_ENGINE="http://nethermind-xdai.dappnode:8551"
  ;;
"gnosis-erigon.dnp.dappnode.eth")
    HTTP_ENGINE="http://gnosis-erigon.dappnode:8551"
  ;;
*)
  echo "Unknown value for _DAPPNODE_GLOBAL_EXECUTION_CLIENT_GNOSIS: $_DAPPNODE_GLOBAL_EXECUTION_CLIENT_GNOSIS"
  # TODO: this default value must be temporary and changed once there are mor than 1 EC
  HTTP_ENGINE="http://nethermind-xdai.dappnode:8551"
  ;;
esac


exec node --max-old-space-size=${MEMORY_LIMIT} /usr/app/node_modules/.bin/lodestar \
    beacon \
    --network=gnosis \
    --suggestedFeeRecipient=${FEE_RECIPIENT_ADDRESS} \
    --jwt-secret=/jwtsecret \
    --execution.urls=$HTTP_ENGINE \
    --dataDir=/var/lib/data \
    --rest \
    --rest.address 0.0.0.0 \
    --rest.port ${BEACON_API_PORT} \
    --port $P2P_PORT \
    --metrics \
    --metrics.port 8008 \
    --metrics.address 0.0.0.0 \
    --logFile /var/lib/data/beacon.log \
    --logLevel=${DEBUG_LEVEL} \
    --logFileLevel=debug \
    --logFileDailyRotate 5 \
    $EXTRA_OPTS
