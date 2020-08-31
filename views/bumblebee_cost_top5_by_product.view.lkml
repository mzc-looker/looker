view: bumblebee_cost_top5_by_product {
  sql_table_name: `mzcdsc-team-200716.test_mark_cheap_price.Bumblebee_Cost_Top5_by_Product`
    ;;

  dimension: allcost {
    type: number
    sql: ${TABLE}.ALLCOST ;;
  }

  dimension: portion {
    type: number
    sql: ${TABLE}.Portion ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
