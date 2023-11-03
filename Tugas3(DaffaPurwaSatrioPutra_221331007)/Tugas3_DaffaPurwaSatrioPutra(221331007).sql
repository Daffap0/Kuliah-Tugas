WITH kabupaten_desa AS (
    SELECT provinsi, kabupaten, COUNT(DISTINCT desa) AS "#desa"
    FROM list_desa
    GROUP BY provinsi, kabupaten
),
urutan_kabupaten AS (
    SELECT provinsi, kabupaten, "#desa",
           ROW_NUMBER() OVER(PARTITION BY provinsi ORDER BY "#desa" DESC) AS urutan_kabupaten
    FROM kabupaten_desa
),
top5_kabupaten AS (
    SELECT provinsi, kabupaten, "#desa", urutan_kabupaten
    FROM urutan_kabupaten
    WHERE urutan_kabupaten <= 5
)
SELECT tk.provinsi, tk.kabupaten, tk.urutan_kabupaten AS urutan, tk."#desa"
FROM top5_kabupaten tk
ORDER BY (SELECT SUM("#desa") FROM kabupaten_desa WHERE provinsi = tk.provinsi) DESC, tk.urutan_kabupaten;
