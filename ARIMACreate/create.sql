CREATE OR REPLACE MODEL
  ETH.etharima_model OPTIONS (model_type = 'ARIMA',
    time_series_timestamp_col = 'Price_Date',
    /*time_series_data_col = 'Closing_Price',*/ time_series_data_col = 'Change',
    auto_arima = TRUE,
    data_frequency = 'AUTO_FREQUENCY' ) AS
SELECT
  CAST(A.date AS datetime) AS Price_Date,
  /* A.Price AS Closing_Price, */ A.Change__ AS Change
FROM
  ethtechanalysis.ETH.ETHCAD A