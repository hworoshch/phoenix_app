## Dockerized PhoenixApp

Run container:
```bash
docker-compose up -d --build 
```

Run iex remote:
```bash
docker exec -it phoenix_web bin/phoenix_app remote
```

Check log level:
```elixir
Logger.level()
# :info
```

Change log level:
```elixir
Logger.configure(level: :debug)
# :ok
```

Check new log level:
```elixir
Logger.level()
# :debug
```
