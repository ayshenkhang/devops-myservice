DevOps Mini Web Service (NGINX-based)	


Layihə haqqında

Bu layihə sadə bir “Hello from DevOps” web-servisidir.
Servis NGINX əsaslı qurulub, Docker konteynerdə işləyir və docker-compose vasitəsilə idarə olunur.
Servis “non-root user” ilə işləyir, loglar host sistemə yazılır, systemd və logrotate inteqrasiyası mövcuddur.

Layihə Strukturu

myservice/
├── html/
│   └── index.html
├── nginx.conf
├── Dockerfile
├── docker-compose.yml
└── 
    ├── /etc/systemd/system/myservice.service
    └── /etc/logrotate.d/myservice


İlk olaraq Ubuntu Server 24.04 quraşdırılır.
Sistem yenilənir və docker ilə docker-compose paketləri quraşdırılır:
Bu mərhələdə docker --version və docker compose version komandaları ilə quraşdırmanın uğurlu olub-olmadığı yoxlanılır.


Servis fayllarını ayrıca saxlamaq üçün myservice adlı qovluq yaradılır:
myservice/
├── html/
├── nginx.conf
├── Dockerfile
└── docker-compose.yml

Nginx konfiqurasiyasının hazırlanır(config faylı gitlab linkinde movcuddur)

Dockerfile hazırlanması
Nginx imicindən istifadə olunaraq konteyner konfiqurasiyası yaradılır(Dockerfile gitlab linkinde movcuddur)

docker-compose.yml faylı hazırlanır
Konteynerin idarə olunması üçün docker-compose konfiqurasiyası yazılır(docker-compose.yml gitlab linkinde movcuddur)

Servisin yığılması və işə salınması
docker compose build --no-cache
docker compose up -d

Test mərhələsi
curl http://localhost:5000


Servisi systemd üzərindən idarə etmək
Bunun üçün ilk növbede /etc/systemd/system/myservice.service faylını yaradırıq(Fayl linkde mövcüddur)


Log rotasiyası (logrotate)

/etc/logrotate.d/myservice faylı yaradılır(linkde mövcuddur)

Daha sonra test edirik
sudo logrotate -v -f /etc/logrotate.d/myservice



