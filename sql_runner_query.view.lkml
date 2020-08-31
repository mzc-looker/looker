view: sql_runner_query {
  derived_table: {
    sql: SELECT A.* , A.cost/TOTALCOST as Portion
      FROM (
        SELECT
          bumblebee_cost_top5_by_product.Product  AS bumblebee_cost_top5_by_product_product,
          COALESCE(SUM(bumblebee_cost_top5_by_product.ProductCost ), 0) AS cost
      --    COALESCE(SUM(bumblebee_cost_top5_by_product.ProductCost/bumblebee_cost_top5_by_product.MonthCost ), 0) AS bumblebee_cost_top5_by_product_portion
        FROM `mzcdsc-team-200716.test_mark_cheap_price.Bumblebee_Cost_Top5_by_Product`
             AS bumblebee_cost_top5_by_product
        WHERE (bumblebee_cost_top5_by_product.Month_nm = '04월') AND (bumblebee_cost_top5_by_product.Year_nm = '2018년')
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 5
      ) A
      CROSS JOIN
      (
        SELECT 'TOTAL' AS product,
        SUM(bumblebee_cost_top5_by_product_cost_1) TOTALCOST
        FROM (
        SELECT
          bumblebee_cost_top5_by_product.Product  AS bumblebee_cost_top5_by_product_product,
          COALESCE(SUM(bumblebee_cost_top5_by_product.ProductCost ), 0) AS bumblebee_cost_top5_by_product_cost_1,
          --COALESCE(SUM(bumblebee_cost_top5_by_product.ProductCost/bumblebee_cost_top5_by_product.MonthCost ), 0) AS bumblebee_cost_top5_by_product_portion
        FROM `mzcdsc-team-200716.test_mark_cheap_price.Bumblebee_Cost_Top5_by_Product`
             AS bumblebee_cost_top5_by_product
        WHERE (bumblebee_cost_top5_by_product.Month_nm = '04월') AND (bumblebee_cost_top5_by_product.Year_nm = '2018년')
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 5
        ) A
      ) B
      --ON A.bumblebee_cost_top5_by_product_product = B.product
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bumblebee_cost_top5_by_product_product {
    type: string
    sql: ${TABLE}.bumblebee_cost_top5_by_product_product ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: portion {
    type: number
    sql: ${TABLE}.Portion ;;
  }

  set: detail {
    fields: [bumblebee_cost_top5_by_product_product, cost, portion]
  }
}
