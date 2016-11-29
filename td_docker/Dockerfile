FROM ruby:2.3-slim

ADD GPG-KEY-td-agent /GPG-KEY-td-agent

RUN apt-key add GPG-KEY-td-agent && \
    echo "deb http://packages.treasuredata.com/2/debian/jessie/ jessie contrib" > /etc/apt/sources.list.d/treasure-data.list && \
    apt-get update && \
    apt-get install -y --force-yes td-agent gcc make libmysqlclient-dev && \
    td-agent-gem install fluent-plugin-mysql-appender

COPY td-agent.conf /etc/td-agent/td-agent.conf

RUN gem install td td-client

ADD GetLastId.rb /GetLastId.rb
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
