# Menggunakan base image Node.js versi 14
FROM node:14

# Menentukan working directory untuk container
WORKDIR /app

# Salin seluruh source code ke dalam container
COPY . .

# Set aplikasi untuk berjalan dalam production environment dan gunakan host database bernama item-db
ENV NODE_ENV=production DB_HOST=item-db

# Instal dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port 8080 agar aplikasi dapat diakses
EXPOSE 8080

# Jalankan server dengan perintah npm start saat container diluncurkan
CMD ["npm", "start"]
