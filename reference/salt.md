# some salt references
sudo salt-call --file-root /path/to/salt/root --local state.apply --id=salt_id pillar='{"user":"username"}'
