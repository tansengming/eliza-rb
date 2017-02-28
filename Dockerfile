FROM ruby:2.4.0

# Configure the main working directory. This is the base 
# directory used in any further RUN, COPY, and ENTRYPOINT 
# commands.
RUN mkdir -p /app 
WORKDIR /app

# Copy the main application.
COPY . ./

# The main command to run when the container starts.
CMD ["./bin/eliza-rb"]