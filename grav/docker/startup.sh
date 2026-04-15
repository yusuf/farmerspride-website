#!/bin/bash
set -e

# ── PHP-FPM setup ──────────────────────────────────────────────────
cat > /usr/local/etc/php-fpm.d/www.conf << 'EOF'
[www]
user = www-data
group = www-data
listen = 127.0.0.1:9000
pm = ondemand
pm.max_children = 5
pm.process_idle_timeout = 10s
pm.max_requests = 200
EOF

# ── Ensure writable Grav directories ──────────────────────────────
for dir in backup cache images logs tmp; do
    mkdir -p /var/www/html/$dir
    chown -R www-data:www-data /var/www/html/$dir
    chmod -R 775 /var/www/html/$dir
done

# ── Seed plugins from image into mounted user/ (first run only) ────
# The bind mount hides /var/www/html/user at runtime. On first boot,
# copy the plugins that were baked into the image so admin works
# without any manual `docker cp`.
PLUGINS_DIR="/var/www/html/user/plugins"
SEED_DIR="/var/www/html/user-image-seed/plugins"

if [ -d "$SEED_DIR" ]; then
    mkdir -p "$PLUGINS_DIR"
    for plugin in "$SEED_DIR"/*/; do
        plugin_name=$(basename "$plugin")
        if [ ! -d "$PLUGINS_DIR/$plugin_name" ]; then
            echo "Seeding plugin: $plugin_name"
            cp -r "$plugin" "$PLUGINS_DIR/$plugin_name"
        fi
    done
    chown -R www-data:www-data "$PLUGINS_DIR"
fi

# ── Create Grav admin account from environment variables ──────────
if [ -n "$GRAV_ADMIN_USER" ] && [ -n "$GRAV_ADMIN_PASS" ]; then
    ACCOUNT_FILE="/var/www/html/user/accounts/${GRAV_ADMIN_USER}.yaml"
    if [ ! -f "$ACCOUNT_FILE" ]; then
        echo "Creating Grav admin account: $GRAV_ADMIN_USER"
        mkdir -p /var/www/html/user/accounts
        HASHED=$(php -r "echo password_hash('${GRAV_ADMIN_PASS}', PASSWORD_DEFAULT);")
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

# ── Clear Grav cache on startup (first run only) ──────────────────
CACHE_CLEARED_FLAG="/var/www/html/cache/.startup-cleared"
if [ ! -f "$CACHE_CLEARED_FLAG" ]; then
    su -s /bin/sh www-data -c \
        "php /var/www/html/bin/grav clearcache" 2>/dev/null || true
    touch "$CACHE_CLEARED_FLAG"
fi

chown -R www-data:www-data \
    /var/www/html/cache \
    /var/www/html/tmp \
    /var/www/html/logs \
    /var/www/html/images \
    /var/www/html/backup

echo "Starting Farmer's Pride — Grav CMS"
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf