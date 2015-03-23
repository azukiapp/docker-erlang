FROM azukiapp/ubuntu
MAINTAINER Azuki <support@azukiapp.com>

ENV ERLANG_VERSION 1.0

# Add PostgreSQL Global Development Group apt source
RUN  wget http://packages.erlang-solutions.com/erlang-solutions_${ERLANG_VERSION}_all.deb \
  && dpkg -i erlang-solutions_${ERLANG_VERSION}_all.deb \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["erl"]
