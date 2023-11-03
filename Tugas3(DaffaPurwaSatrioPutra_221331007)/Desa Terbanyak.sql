WITH provinsi_desa AS (
    SELECT provinsi, SUM(jumlah_desa) AS jumlah_desa
    FROM (
        SELECT provinsi, kabupaten, COUNT(DISTINCT desa) AS jumlah_desa
        FROM list_desa
        GROUP BY provinsi, kabupaten
    ) AS kabupaten_desa
    GROUP BY provinsi
)
SELECT provinsi, jumlah_desa
FROM provinsi_desa
ORDER BY jumlah_desa DESC;
