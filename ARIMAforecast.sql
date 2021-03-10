#standardSQL
SELECT
  history_timestamp AS timestamp,
  history_value,
  NULL AS forecast_value,
  NULL AS prediction_interval_lower_bound,
  NULL AS prediction_interval_upper_bound
FROM (
  SELECT
    CAST(A.date AS datetime) AS history_timestamp,
    A.Change__ AS history_value
  FROM
    `ethtechanalysis.ETH.ETHCAD` A
  ORDER BY
    date ASC )
UNION ALL
SELECT
  CAST(forecast_timestamp AS date) AS timestamp,
  NULL AS history_value,
  forecast_value,
  prediction_interval_lower_bound,
  prediction_interval_upper_bound
FROM
  ML.FORECAST(MODEL ETH.etharima_model,
    STRUCT(10 AS horizon,
      0.95 AS confidence_level))
