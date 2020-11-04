connection: "bumblebee_dev"

# include all the views
include: "/views/**/*.view"

datagroup: bumblebee_dev_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bumblebee_dev_default_datagroup

#explore: dim_account {}

#explore: dim_date {}

#explore: dim_product {}

#explore: dim_region {}

explore: f_cost {
  label: "cost_analisys"
}
