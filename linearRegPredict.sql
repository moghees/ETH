#standardSQL
SELECT
  predicted_close_price
FROM
  ML.PREDICT(MODEL `ETH.price_reg_model`,
    (
    SELECT
      A.Volume,
      A.Open AS open_price
    FROM
      `ethtechanalysis.ETH.ETHCAD` A
    WHERE
      A.Volume = 1050 ))