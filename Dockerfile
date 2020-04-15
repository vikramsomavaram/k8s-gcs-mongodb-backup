# Consider gcloud-sdk as base image
FROM google/cloud-sdk:alpine

# Install required mongo-tools
RUN apk update && apk add mongodb-tools && rm -rf /var/cache/apk/*

# Copy backup script to image
ADD mongobackup.sh /var/mongobackup/mongobackup.sh

# Give full permissions to the script
RUN chmod 777 /var/mongobackup/mongobackup.sh

# Execute the backup script during startup
CMD /var/mongobackup/mongobackup.sh
