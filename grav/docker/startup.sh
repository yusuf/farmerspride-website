#!/bin/bash
set -e

# ── PHP-FPM TCP setup ──────────────────────────────────────────────
cat > /usr/local/etc/php-fpm.d/www.conf << 'EOF'
[www]
user = www-data
group = www-data

listen = 127.0.0.1:9000

pm = dynamic
pm.max_children = 20
pm.start_servers = 4
pm.min_spare_servers = 2
pm.max_spare_servers = 6
pm.max_requests = 500

clear_env = no
catch_workers_output = yes
decorate_workers_output = no
EOF

# ── Ensure writable Grav directories ──────────────────────────────
for dir in backup cache images logs tmp; do
    mkdir -p /var/www/html/$dir
    chown -R www-data:www-data /var/www/html/$dir
    chmod -R 775 /var/www/html/$dir
done

# ── Create Grav admin account from environment variables ──────────
if [ -n "$GRAV_ADMIN_USER" ] && [ -n "$GRAV_ADMIN_PASS" ]; then
    ACCOUNT_FILE="/var/www/html/user/accounts/${GRAV_ADMIN_USER}.yaml"
    if [ ! -f "$ACCOUNT_FILE" ]; then
        echo "Creating Grav admin account: $GRAV_ADMIN_USER"
        mkdir -p /var/www/html/user/accounts
        HASHED=$(php -r "echo password_hash(getenv('GRAV_ADMIN_PASS'), PASSWORD_DEFAULT);")
        cat > "$ACCOUNT_FILE" << EOF2
email: ${GRAV_ADMIN_EMAIL:-admin@agrolink.com.mv}
fullname: Administrator
title: Admin
state: enabled
access:
  admin:
    login: true
    super: true
  site:
    login: true
hashed_password: ${HASHED}
EOF2
        chown www-data:www-data "$ACCOUNT_FILE"
        echo "Admin account created."
    fi
fi

# ── Clear Grav cache on startup ────────────────────────────────────
# php /var/www/html/bin/grav clear-cache 2>/dev/null || true

cd /var/www/html

# Clean bad state
rm -rf cache/* logs/*

# Install required plugins cleanly
bin/gpm install form -f

# Clear cache again
bin/grav clearcache


echo "Starting Farmer's Pride — Grav CMS"
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf