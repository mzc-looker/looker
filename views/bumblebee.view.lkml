view: bumblebee {
  #sql_table_name: `test_mark_cheap_price.Bumblebee` ;;

  derived_table: {
    sql:
      select Year_nm
          , Month_nm
          , Account_Name
          , Region
          , Category
          , sum(Cost) as Cost
          , sum(Qty) as Qty
    from Bumblebee
    group by
          Year_nm
          , Month_nm
          , Account_Name
          , Region
          , Category ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.Account_Name ;;

  }

  dimension: api_gateway_type {
    type: string
    sql: ${TABLE}.ApiGateway_type ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;

    drill_fields: [product]
  }

  dimension: cf_request_type {
    type: string
    sql: ${TABLE}.CF_request_type ;;
  }

  dimension: cloudwatch_type {
    type: string
    sql: ${TABLE}.Cloudwatch_type ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.Cost_type ;;
  }

  dimension: data_usage_type {
    type: string
    sql: ${TABLE}.Data_Usage_type ;;
  }

  dimension: db_engine1 {
    type: string
    sql: ${TABLE}.DB_engine1 ;;
  }

  dimension: db_engine2 {
    type: string
    sql: ${TABLE}.DB_engine2 ;;
  }

  dimension: db_storage_type {
    type: string
    sql: ${TABLE}.DB_storage_type ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: dynamo_capacity_unit {
    type: string
    sql: ${TABLE}.Dynamo_capacity_unit ;;
  }

  dimension: ebs_provisioned {
    type: string
    sql: ${TABLE}.EBS_provisioned ;;
  }

  dimension: ebs_usage_type {
    type: string
    sql: ${TABLE}.EBS_Usage_type ;;
  }

  dimension: ebs_volume_type {
    type: string
    sql: ${TABLE}.EBS_Volume_type ;;
  }

  dimension: ec2_os {
    type: string
    sql: ${TABLE}.EC2_OS ;;
  }

  dimension: fargate_type {
    type: string
    sql: ${TABLE}.Fargate_type ;;
  }

  dimension: instance_type {
    type: string
    sql: ${TABLE}.Instance_type ;;
  }

  dimension: lambda_type {
    type: string
    sql: ${TABLE}.Lambda_type ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }

  dimension: month_nm {
    type: string
    sql: ${TABLE}.Month_nm ;;
  }

  dimension: previous_cost {
    type: number
    sql: ${TABLE}.Previous_Cost ;;
  }

  dimension: previous_qty {
    type: number
    sql: ${TABLE}.Previous_Qty ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;

    link: {
      label: "Website"
      url: "http://www.google.com/search?q={{ value | encode_uri }}+clothes&btnI"
      icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
    }

    link: {
      label: "Facebook"
      url: "http://www.google.com/search?q=site:facebook.com+{{ value | encode_uri }}+clothes&btnI"
      icon_url: "https://static.xx.fbcdn.net/rsrc.php/yl/r/H3nktOa7ZMg.ico"
    }

    link: {
      label: "{{value}} 계정별 Product 분석"
      url: "/dashboards/13?Product={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }

    drill_fields: [account_name]
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.Qty ;;
  }

  dimension: qty_720 {
    type: number
    sql: ${TABLE}.Qty_720 ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: s3_class {
    type: string
    sql: ${TABLE}.S3_class ;;
  }

  dimension: s3_request {
    type: string
    sql: ${TABLE}.S3_request ;;
  }

  dimension: usage_type {
    type: string
    sql: ${TABLE}.Usage_type ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.Year ;;
  }

  dimension: year_nm {
    type: string
    sql: ${TABLE}.Year_nm ;;
  }

  dimension: yyyymm {
    type: string
    sql: ${TABLE}.YYYYMM ;;
  }

  set: detail {
    fields: [account_name, category, region, usage_type]
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }

  measure: Cost {
    type: sum
    sql: ${cost} ;;
    value_format:"$#,###.00;($#,###.0)"
  }

  measure: Previous_Cost {
    type: sum
    sql: ${previous_cost} ;;
    value_format:"$#,###.00;($#,###.0)"
  }

  measure: Increase_Rate {
    type: sum
    sql: (${cost} -${previous_cost})/${cost} ;;
    value_format:"$#,###.00;($#,###.0)"
  }

  measure: Gap {
    type: sum
    sql: ${cost} -${previous_cost} ;;
    value_format:"$#,###.00;($#,###.0)"
  }
}
