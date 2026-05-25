# Builder

FROM elixir:1.15-alpine AS builder

RUN apk add --no-cache build-base git nodejs npm

WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

ENV MIX_ENV=prod

COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV
RUN mix deps.compile

COPY config config
COPY lib lib
RUN mix compile

COPY priv priv
COPY assets assets
RUN mix assets.deploy
RUN mix release

# Runner

FROM alpine:3.18 AS runner

RUN apk add --no-cache libstdc++ openssl ncurses-libs

WORKDIR /app

COPY --from=builder /app/_build/prod/rel/phoenix_app ./

COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

ENV MIX_ENV=prod
ENV PHX_SERVER=true
ENV PORT=4000

EXPOSE 4000

ENTRYPOINT ["/app/entrypoint.sh"]
