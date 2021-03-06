connection: "mzcdsc-team-200716"

# include all the views
include: "/views/**/*.view"

datagroup: bumblebee_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 minute"
}

persist_with: bumblebee_default_datagroup

explore: bumblebee {
  access_filter: {
    field: bumblebee.account_name
    user_attribute: accountname
  }

}

# explore: bee_data_202007_3 {}

# explore: bumblebee_data_trans_4 {}

# explore: bumblebee_data_trans_5 {}

# explore: ecommerce_sample_2 {}

# explore: test_partition {
#   join: test_partition__products {
#     view_label: "Test Partition: Products"
#     sql: LEFT JOIN UNNEST(${test_partition.products}) as test_partition__products ;;
#     relationship: one_to_many
#   }

#   join: test_partition__geoip {
#     view_label: "Test Partition: Geoip"
#     sql: LEFT JOIN UNNEST([${test_partition.geoip}]) as test_partition__geoip ;;
#     relationship: one_to_one
#   }

#   join: test_partition__geoip__location {
#     view_label: "Test Partition: Geoip Location"
#     sql: LEFT JOIN UNNEST([${test_partition__geoip.location}]) as test_partition__geoip__location ;;
#     relationship: one_to_one
#   }
# }
