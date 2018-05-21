source shared/eosio_disco.sh

string_to_name() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        bin/string_to_name_mac_osx $1
    else
        bin/string_to_name_linux $1
    fi
}


target_p2p_addresses() {
    seed_network=$1

    get_table_rows $seed_network discovery | jq -r '.rows[].content.target_p2p_address'
}

p2p_peer_address_list() {
    seed_network=$1

    for peer in $(target_p2p_addresses $seed_network); do
        echo "p2p-peer-address = $peer"
    done
}


get_genesis_table() {
    seed_network="$1"
    account_name="$2"

    account_uint64=$(string_to_name "$account_name")

    get_table_rows_lub $seed_network genesis $account_uint64 $(($account_uint64 + 1))
}

get_genesis_json() {
    seed_network="$1"
    account_name="$2"

    get_genesis_table $seed_network $account_name | jq '.rows[0].genesis_json | fromjson'
}
