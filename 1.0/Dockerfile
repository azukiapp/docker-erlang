FROM azukiapp/node:debian
MAINTAINER Azuki <support@azukiapp.com>

ENV ERLANG_VERSION 1.0

# This NOT WORKING: https://github.com/elixir-lang/elixir/issues/3019
# RUN  wget http://packages.erlang-solutions.com/erlang-solutions_${ERLANG_VERSION}_all.deb \
#   && dpkg -i erlang-solutions_${ERLANG_VERSION}_all.deb \

# Get and install erlang from deb package
RUN  wget -qO - http://packages.erlang-solutions.com/debian/erlang_solutions.asc | apt-key add - \
  && echo 'deb http://packages.erlang-solutions.com/debian wheezy contrib' > /etc/apt/sources.list.d/erlang-solutions.list \
  && apt-get update -yy \
  && apt-get install -y --no-install-recommends erlang-crypto erlang-syntax-tools \
  && apt-get autoremove --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["erl"]
