FROM chronograf:alpine

RUN mkdir -p /usr/share/chronograf/resources

#ADD dev-jedlix.src /usr/share/chronograf/resources
#ADD dev-jedlix.kap /usr/share/chronograf/resources

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["chronograf"]
