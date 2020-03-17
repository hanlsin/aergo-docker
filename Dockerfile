FROM golang:1.13-alpine as builder
RUN apk update && apk add git cmake build-base m4
# if --build-arg GIT_REPO=<git_repository_for_go>
ARG GIT_REPO
RUN if [ -n "$GIT_REPO" ]; \
	then \
		go get ${GIT_REPO}; \
	else \
		go get github.com/aergoio/aergo; \
	fi
WORKDIR ${GOPATH}/src/${GIT_REPO}
# if --build-arg GIT_BRANCH=<git_branch_name>
ARG GIT_BRANCH
RUN if [ -n "$GIT_BRANCH" ]; \
	then \
		git checkout ${GIT_BRANCH}; \
	fi
RUN git submodule init
RUN git submodule update
RUN make

FROM alpine:3.9
RUN apk add --no-cache libgcc bash
# import external tools
COPY ./tools /aergo/tools
ENV PATH="/aergo/tools/ship-1.0-SNAPSHOT/bin:/aergo/tools/crudini-0.9.3:${PATH}"
# import aergo bineries
ARG GIT_REPO
COPY --from=builder /go/src/${GIT_REPO}/bin/* /aergo/bin/
COPY --from=builder /go/src/${GIT_REPO}/libtool/lib/* /aergo/lib/
COPY --from=builder /go/src/${GIT_REPO}/Docker/conf/* /aergo/conf/
ENV PATH="/aergo/bin:${PATH}"
ENV LD_LIBRARY_PATH="/aergo/lib:${LD_LIBRARY_PATH}"
# import run scripts
COPY ./run/alone/* /aergo/
ENV AERGO_BIN_PATH="/aergo/bin"
WORKDIR /aergo/
CMD ./run.sh
EXPOSE 7845
