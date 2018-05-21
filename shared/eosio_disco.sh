get_table_rows() {
    end_point=$1
    table_name=$2

    http post $end_point/v1/chain/get_table_rows scope=eosio.disco code=eosio.disco json=true table=$table_name table_key=id limit=1000
}

get_table_rows_lub() {
    end_point=$1
    table_name=$2
    lower_bound=$3
    upper_bound=$4

    http post $end_point/v1/chain/get_table_rows \
         scope=eosio.disco \
         code=eosio.disco \
         json=true \
         table=$table_name \
         table_key=id \
         lower_bound=$lower_bound \
         upper_bound=$upper_bound
}
