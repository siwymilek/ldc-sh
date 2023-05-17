# Lazy docker compose for lazy whiners

The Lazy docker compose is a handy shell script that simplifies the usage of Docker Compose commands by providing convenient shortcuts. It automates the loading of all Docker Compose files in the current directory, allowing you to manage your Docker Compose projects effortlessly.

## Usage

To install lazy docker compose, you should run the install script. You can do it using curl or wget command:
```bash
curl -o- https://raw.githubusercontent.com/siwymilek/ldc-sh/main/install.sh | bash
```

```bash
wget -qO- https://raw.githubusercontent.com/siwymilek/ldc-sh/main/install.sh | bash`
```

## Available commands

| lazy command | docker compose command |
|--------------|------------------------|
| ldc up       | docker compose up      |
| ldc down     | docker compose down    |
| ldc ps       | docker compose ps      |
| ldc logs     | docker compose logs    |
| ldc build    | docker compose build   |
| ldc start    | docker compose start   |
| ldc stop     | docker compose stop    |
| ldc restart  | docker compose restart |
| ldc exec     | docker compose exec    |
| ldc run      | docker compose run     |
| ldc scale    | docker compose scale   |
| ldc pause    | docker compose pause   |
| ldc unpause  | docker compose unpause |
| ldc rm       | docker compose rm      |

