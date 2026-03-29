FROM php:8.2-fpm-alpine

# ── System dependencies ────────────────────────────────────────────
RUN apk add --no-cache \
    nginx \
    supervisor \
    curl \
    zip \
    unzip \
    git \
    bash \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    freetype-dev \
    icu-dev \
    libxml2-dev \
    libzip-dev \
    oniguruma-dev

# ── PHP extensions required by Grav ───────────────────────────────
RUN docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
    && docker-php-ext-install -j$(nproc) \
        gd \
        mbstring \
        intl \
        xml \
        dom \
        zip \
        opcache

# ── PHP configuration ──────────────────────────────────────────────
COPY docker/php.ini /usr/local/etc/php/conf.d/custom.ini

# ── Download and install Grav + Admin plugin ───────────────────────
ARG GRAV_VERSION=1.7.46
RUN curl -o /tmp/grav.zip -L \
        "https://github.com/getgrav/grav/releases/download/${GRAV_VERSION}/grav-admin-v${GRAV_VERSION}.zip" \
    && unzip -q /tmp/grav.zip -d /tmp/ \
    && cp -r /tmp/grav-admin/. /var/www/html/ \
    && rm -rf /tmp/grav.zip /tmp/grav-admin \
    && chown -R www-data:www-data /var/www/html

# ── Tailwind CSS standalone CLI ────────────────────────────────────
RUN curl -sLo /usr/local/bin/tailwindcss \
        https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64 \
    && chmod +x /usr/local/bin/tailwindcss

# ── Nginx configuration ────────────────────────────────────────────
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/vhost.conf /etc/nginx/http.d/default.conf

# ── Supervisor (runs nginx + php-fpm together) ─────────────────────
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# ── Copy Grav user directory (theme + pages + config) ─────────────
# This is populated by Claude Code — built into user/ by Claude Code session
COPY --chown=www-data:www-data user/ /var/www/html/user/

# ── Build Tailwind CSS ─────────────────────────────────────────────
WORKDIR /var/www/html/user/themes/farmerspride
RUN if [ -f tailwind.config.js ] && [ -f src/styles.css ]; then \
        tailwindcss -i src/styles.css -o css/theme.css --minify && \
        echo "Tailwind CSS compiled successfully"; \
    else \
        echo "Tailwind source not found — skipping CSS build (run Claude Code first)"; \
    fi

# ── Permissions ────────────────────────────────────────────────────
# mkdir -p ensures all writable dirs exist before chmod — Grav may not create
# all of them on first install, and chmod on a missing dir fails the build
WORKDIR /var/www/html
RUN mkdir -p \
        /var/www/html/backup \
        /var/www/html/cache \
        /var/www/html/images \
        /var/www/html/logs \
        /var/www/html/tmp \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 \
        /var/www/html/backup \
        /var/www/html/cache \
        /var/www/html/images \
        /var/www/html/logs \
        /var/www/html/tmp \
        /var/www/html/user

# ── Startup script ─────────────────────────────────────────────────
COPY docker/startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

CMD ["/startup.sh"]
