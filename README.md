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


İlk olaraq Ubuntu Server 24.04 quraşdırdım.
Sistemdə var olan updateləri verdim və docker ilə docker-compose paketləri quraşdırdım:
sudo apt update && sudo apt upgrade -y
sudo apt install docker.io docker-compose-plugin -y

Bu mərhələdə docker --version və docker compose version komandaları ilə quraşdırmanın uğurlu olub-olmadığı yoxlanılır.
Qeyd: Bütün konfiqurasiya faylları layihənin GitHub repozitoriyasında yerləşir.

Servis fayllarını ayrıca saxlamaq üçün myservice adlı qovluq yaradılır:
myservice/
├── html/
├── nginx.conf
├── Dockerfile
└── docker-compose.yml

Nginx konfiqurasiyasının hazırlanır(config faylı github linkinde movcuddur)

Dockerfile hazırlanması
Nginx imagesindən istifadə olunaraq konteyner konfiqurasiyası yaratdım(Dockerfile github linkinde movcuddur)

docker-compose.yml faylı hazırladım
Konteynerin idarə olunması üçün docker-compose konfiqurasiyası yazdım(docker-compose.yml github linkinde movcuddur)

Servisi build etdim və işə saldım:
docker compose build --no-cache
docker compose up -d

Test mərhələsi
curl http://localhost:5000


Servisi systemd üzərindən idarə etmək:
Bunun üçün ilk növbede /etc/systemd/system/myservice.service faylını yaratdım(Fayl linkde mövcüddur)
sudo systemctl daemon-reload
sudo systemctl enable --now myservice
sudo systemctl status myservice
Servis active (running) vəziyyətdə qalır və sistem açıldıqda avtomatik işə düşür.

Log rotasiyası (logrotate)

/etc/logrotate.d/myservice faylı yaratdım(linkde mövcuddur)

Daha sonra test etdim
sudo logrotate -v -f /etc/logrotate.d/myservice



