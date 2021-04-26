ARG VIRTUAL_ENV_INSTALLS="basic python nodejs rust google-cloud-sdk"
ARG VIRTUAL_ENV_PACKAGES="pkg-config build-essential axel postgresql-client libpq-dev libssl-dev"
FROM dysnix/github-actions-runner:onbuild

ENV SOLC_VER=0.5.17 \
    SOLC_SUM=c35ce7a4d3ffa5747c178b1e24c8541b2e5d8a82c1db3719eb4433a1f19e16f3

## required development tools and dependencies
RUN # install solc binary \
    ( cd /usr/local/bin && curl -fsSLo solc https://github.com/ethereum/solidity/releases/download/v${SOLC_VER}/solc-static-linux && \
      printf "${SOLC_SUM}  solc" | sha256sum -c && chmod 755 solc ) && \
    # clean up \
    apt-get -y clean && \
    rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*
