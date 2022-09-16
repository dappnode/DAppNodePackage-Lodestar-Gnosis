# Concatenate EXTRA_OPTS string
[[ -n "$CHECKPOINT_SYNC_URL" ]] && EXTRA_OPTS="${EXTRA_OPTS} --checkpointSyncUrl=${CHECKPOINT_SYNC_URL}"

exec node /usr/app/node_modules/.bin/lodestar \
    beacon \
    --network=mainnet \
    --jwt-secret=/jwtsecret \
    --execution.urls=$HTTP_ENGINE \
    --dataDir=/var/lib/data \
    --rest \
    --rest.address 0.0.0.0 \
    --rest.port ${BEACON_API_PORT} \
    --port $P2P_PORT \
    --logFile /var/lib/data/beacon.log \
    --logFileLevel ${DEBUG_LEVEL} \
    --logFileDailyRotate 5 \
    $EXTRA_OPTS