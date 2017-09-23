FROM jenkins/jenkins:lts

USER root

# Install Node
RUN cd /usr/local/bin && mkdir _node && cd /usr/local/bin/_node && wget https://nodejs.org/dist/v6.9.4/node-v6.9.4-linux-x64.tar.xz -O - | tar Jxf - --strip-components=1
RUN ln -s "/usr/local/bin/_node/bin/node" "/usr/local/bin/node" # Making the symbolic link to node
RUN ln -s "/usr/local/bin/_node/lib/node_modules/npm/bin/npm-cli.js" "/usr/local/bin/npm" ## making the symbolic link to npm

# Install pip
RUN cd ~
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install awscli
USER jenkins
