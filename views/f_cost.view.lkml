view: f_cost {
  sql_table_name: dm.f_cost ;;

  dimension: account_id {
    type: string
    sql: ${TABLE}."account_id" ;;
  }

  dimension: account_nm {
    type: string
    sql: ${TABLE}."account_nm" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."category" ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."cost" ;;
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}."cost_type" ;;
  }

  dimension: etc1 {
    type: string
    sql: ${TABLE}."etc1" ;;
  }

  dimension: etc2 {
    type: string
    sql: ${TABLE}."etc2" ;;
  }

  dimension_group: insertdt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."insertdt" ;;
  }

  dimension: instance_type_desc {
    type: string
    sql: ${TABLE}."instance_type_desc" ;;
  }

  dimension: instance_type_usage {
    type: string
    sql: ${TABLE}."instance_type_usage" ;;
  }

  dimension: month_id {
    type: number
    sql: ${TABLE}."month_id" ;;
  }

  dimension: month_nm {
    type: string
    sql: ${TABLE}."month_nm" ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}."operation" ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}."product" ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}."product_type" ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}."qty" ;;
  }

  dimension: qty_desc {
    type: number
    sql: ${TABLE}."qty_desc" ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}."region_id" ;;
  }

  dimension: region_nm {
    type: string
    sql: ${TABLE}."region_nm" ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}."year_id" ;;
  }

  dimension: year_nm {
    type: string
    sql: ${TABLE}."year_nm" ;;
  }

  dimension: yyyymmdd {
    type: string
    sql: ${TABLE}."yyyymmdd" ;;
  }

  dimension: yyyymmdd_id {
    type: number
    sql: ${TABLE}."yyyymmdd_id" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: Qty {
    type: sum
    sql: ${qty} ;;
    value_format:"$#,###.00;($#,###.0)"
  }

  measure: Qty720 {
    type: sum
    sql: ${qty_desc} ;;
    value_format:"$#,###.00;($#,###.0)"
  }

  measure: Cost {
    type: sum
    sql: ${cost} ;;
    value_format:"$#,###.00;($#,###.0)"
  }
}
