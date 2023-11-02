update mahasiswa 
set umur = extract (year from age(current_date, tanggal_lahir));

select min(umur) as termuda, max(umur) as tertua
from mahasiswa