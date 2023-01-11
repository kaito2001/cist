LOG= #FILENAME FOR LOG FILE
PWD= # YOUR WALLET PASSOWORD
TX_COUNT= # TOTAL TX COUNT
FROM_WALLET_ADDRESS=# WALLET SENDING TX FROM
TO_WALLET_ADDRESS=# WALLET SENDINF TX TO
TX_AMOUNT=# AMOUNT OF EACH TX (EXAMPLE: "10000ucist")
DELAY=# DURATION BETWEEN TRANSACTIONS IN SECONDS
NODE_CHAIN=# NETWORK CHAIN-ID
TX_FEES=# TRANSACTION FEES (EXAMPLE: "300ucist")
# --- END ---
light_green='\033[92m'
blank='\033[0m'
c=1
printf "$light_green Sending $TX_COUNT TX:$blank\n"
(
  while [ $c -le $TX_COUNT ]
  do
      TX_STATUS=$(echo $PWD | cistd tx bank send $FROM_WALLET_ADDRESS $TO_WALLET_ADDRESS $TX_AMOUNT --chain-id=$NODE_CHAIN --gas=auto --fees=$TX_FEES -y)
      TX_HASH=$(echo $TX_STATUS | jq -r .txhash)
      echo -e "$light_green TX $c $blank- $TX_HASH"
      echo $TX_HASH >> $LOG
        sleep $DELAY
      ((c=c+1))
  done
)







