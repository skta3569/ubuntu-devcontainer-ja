FROM --platform=$BUILDPLATFORM mcr.microsoft.com/devcontainers/base:noble

# 日本語関連パッケージのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends locales \
    && rm -rf /var/lib/apt/lists/*

# ロケールの設定
RUN echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    update-locale LC_ALL=ja_JP.UTF-8

# タイムゾーンの設定 (必要に応じて)
# RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
#     dpkg-reconfigure --frontend noninteractive tzdata

# ユーザーの言語設定 (必要に応じて)
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
