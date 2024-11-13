
FROM python:3.8-slim


WORKDIR /usr/src/app


COPY . .

# Make the shell script executable
RUN chmod +x run_parser.sh

# Run the shell script when the container starts
CMD ["./run_parser.sh"]