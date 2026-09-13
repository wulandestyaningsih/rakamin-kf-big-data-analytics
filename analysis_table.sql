-- Create Analysis Table
CREATE OR REPLACE TABLE `rakamin-kf-analytics-508005.kimia_farma.analysis_table` AS
SELECT 
  t.transaction_id,
  t.date,
  t.branch_id,
  b.branch_name,
  b.kota,
  b.provinsi,
  b.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  p.price AS actual_price,
  t.discount_percentage,
  
  -- Persentase gross laba berdasarkan harga obat (actual_price)
  CASE 
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price BETWEEN 50001 AND 100000 THEN 0.15
    WHEN p.price BETWEEN 100001 AND 300000 THEN 0.20
    WHEN p.price BETWEEN 300001 AND 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  -- Menghitung nett_sales (harga setelah diskon)
  p.price * (1 - (t.discount_percentage / 100)) AS nett_sales,

  -- Menghitung nett_profit (keuntungan bersih berdasarkan persentase laba dari nett_sales)
  (p.price * (1 - (t.discount_percentage / 100))) * 
  CASE 
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price BETWEEN 50001 AND 100000 THEN 0.15
    WHEN p.price BETWEEN 100001 AND 300000 THEN 0.20
    WHEN p.price BETWEEN 300001 AND 500000 THEN 0.25
    ELSE 0.30
  END AS nett_profit,

  t.rating AS rating_transaksi

FROM 
  `rakamin-kf-analytics-508005.kimia_farma.kf_final_transaction` AS t
LEFT JOIN 
  `rakamin-kf-analytics-508005.kimia_farma.kf_kantor_cabang` AS b 
  ON t.branch_id = b.branch_id
LEFT JOIN 
  `rakamin-kf-analytics-508005.kimia_farma.kf_product` AS p 
  ON t.product_id = p.product_id;
