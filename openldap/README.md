# Login for phpLDAPAdmin
User is `cn=admin,dc=example,dc=org`
Password is `admin`

# Users
Click the `Import` button
Upload `users.ldif`


# Notes
* Team Sync does not create users in Grafana. Users still need to login for the first time to get their Grafana user created. When they login for the first time, they are placed into the correct Team based on the Team Sync settings. Once that user is created, their Team membership status is synced every X minutes.