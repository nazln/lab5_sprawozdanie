# Lab5 — Wieloetapowe budowanie obrazów Docker

## Struktura projektu

```
lab5/
├── Dockerfile                         # Dwuetapowy Dockerfile
├── alpine-minirootfs-3.21.3-x86_64.tar  # Minimalny system Alpine (FROM scratch)
├── index.html                         # Szablon strony HTML
├── entrypoint.sh                      # Skrypt startowy (uzupełnia IP/hostname)
└── README.md
```

## Pobranie Alpine minirootfs

Przed budową obrazu pobierz plik TAR:

```bash
wget https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/alpine-minirootfs-3.21.3-x86_64.tar.gz
# rozpakuj jeśli potrzeba — Docker przyjmuje też .tar.gz
```

## Polecenie budowy obrazu

```bash
docker build -t web_lab5:v1.0 --build-arg VERSION=1.0.0 .
```

## Polecenie uruchomienia kontenera

```bash
docker run -d -p 8080:80 --name myweb_lab5 web_lab5:v1.0
```

## Polecenie weryfikacji działania kontenera

```bash
# Status kontenera i HEALTHCHECK
docker ps --filter name=myweb_lab5

# Sprawdzenie odpowiedzi aplikacji
curl localhost:8080
```