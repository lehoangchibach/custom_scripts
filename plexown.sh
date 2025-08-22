#!/bin/bash

# chmod files
find /Media -type f \! -perm 664 -exec chmod 664 {} \; -print
find /Media -type f \! -perm 664 -exec chmod 664 {} \; -print
find /Media -type f \! -perm 664 -exec chmod 664 {} \; -print

# chmod directories
find /Media -type d \! -perm 775 -exec chmod 775 {} \; -print
find /Media -type d \! -perm 775 -exec chmod 775 {} \; -print
find /Media -type d \! -perm 775 -exec chmod 775 {} \; -print

# chown everything
find /Media \! -user plex -exec chown plex:plex {} \; -print
find /Media \! -user plex -exec chown plex:plex {} \; -print
find /Media \! -user plex -exec chown plex:plex {} \; -print
